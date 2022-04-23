//
//  BeerListViewController.swift
//  Brewery
//
//  Created by 양준식 on 2022/03/31.
//

import UIKit

class BeerListViewController: UITableViewController {
    var beerList = [Beer]()
    //이전에 있던 Task인지 비교하기 위한 배열
    var dataTasks = [URLSessionTask]()
    
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UINavigationBar
        
        title = "Yang브루어리"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //UITableView 설정
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        // DataSource 프로토콜에서 설정해줄 수 있지만 이렇게도 가능하다.
        tableView.rowHeight = 150
        
        //스크롤 시, 추가 로딩을 위해
        tableView.prefetchDataSource = self
        //첫 25개의 beer list 가져옴 => currentPage 는 2가 됨
        fetchBeer(of: currentPage)
        
        
    }
}

//UITableView DataSource, Delegate

extension BeerListViewController: UITableViewDataSourcePrefetching{
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //하나의 섹션
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt: \(indexPath.row)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else { return UITableViewCell()}
                
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let detailViewController = BeerDetailViewController()
        detailViewController.beer = selectedBeer
        self.show(detailViewController ,sender: nil)
    }
    
    // 반드시 구현
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
       
       //currentPage가 1이면 하지않음 (viewDidLoad 내의 fetchBeer가 했으므로)
        guard currentPage != 1 else { return }

        //더 prefetch할 것이 없다면 더 미리 load
        indexPaths.forEach {
            if ($0.row + 1) / 25 + 1 == currentPage {
                self.fetchBeer(of: currentPage)
            }
        }
        
    }
    
    
    
}

//Data Fetching
private extension BeerListViewController {
    func fetchBeer(of page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)"),
        dataTasks.firstIndex(where: { $0.originalRequest?.url == url }) == nil // 방금 생성한 url이 실행된 적이 없어야한다.
            else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from : data) else {
                print("ERROR: URLSession data task \(error?.localizedDescription ?? "")")
                return
            }
            
            switch response.statusCode{
            case(200...299)://성공
                self.beerList += beers
                self.currentPage += 1
                
                //UI작업은 main스레드에서 하도록
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            case(400...499)://클라이언트 에러
                print("""
ERROR: Client ERROR \(response.statusCode)
Response: \(response)
""")
            case(500...599)://서버에러
                print("""
ERROR: Server ERROR \(response.statusCode)
Response: \(response)
""")
            default://이외
                print("""
ERROR: ERROR \(response.statusCode)
Response: \(response)
""")
                
            }
        }
        dataTask.resume() // 해당 task를 실행
        dataTasks.append(dataTask)
    }
}
