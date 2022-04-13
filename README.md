# Swift_Toy_Apps_2

# 1. Brewery 앱

> ## 1.1. URLSession
Foundation에서 기본 제공하는 Class. HTTP포함 OSI(Open System INterconnection)7계층의 Protocol을 지원
네트워크 인증, 쿠키, 캐시 관리 등 지원 

> ## 1.1.1 URLSession LifeCycle
![IMG_7F92C200D7D0-1](https://user-images.githubusercontent.com/75043852/163135717-6277f074-e57f-48e5-b040-c77073b9b744.jpeg)

# 2. AppStore 앱 

> ## 2.1 UITabBarController 

UITabBarController는 기본적으로 viewControllers라는 프로퍼티를 가지고있고, 탭을 구성할 ViewController들을 
* viewControllers = [UIViewController1, UIViewController2]
와 같이 넣어주면 된다.

TabBarController에 등록된 각 viewController가 Tab에서 보여질 모습은
* viewController.tabBarItem = UITabBarItem(title:, image:,tag:)
로 설정해줄 수 있다.

> ## 2.2. UICollectionView

UICollectionView는 언제나 layout이 필요하다.
* UITableView와 같이 DelegateFlowLayout, DataSource 프로토콜을 구현해주어야한다. 

Cell Reuse는 collectionView.register(Cell클래스.self, forCellWithReuseIdentifier:"이름")으로 등록 후,
DataSource의 cellForItemAt 메서드에 "이름"을 통해 등록된 Cell객체를 메모리 상에서 Reuse하는 것이다.
