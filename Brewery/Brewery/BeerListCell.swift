//
//  BeerListCell.swift
//  Brewery
//
//  Created by 양준식 on 2022/03/31.
//

import UIKit
import Kingfisher
import SnapKit

class BeerListCell: UITableViewCell {
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerImageView, nameLabel, taglineLabel].forEach {
            contentView.addSubview($0)
        }
        
        beerImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0

        beerImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints{
            //시작점을 끝에 맞춤
            $0.leading.equalTo(beerImageView.snp.trailing).offset(10)
            //label의 밑을 이미지의 가운데에 맞춤
            $0.bottom.equalTo(beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }

        taglineLabel.snp.makeConstraints{
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: "beer.imageURL" ?? "")
        
        beerImageView.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "beer_icon") )
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagLine
        
        //우측 꺾쇠모양
        accessoryType = .disclosureIndicator
        //tap하더라도 회색 효과 X
        selectionStyle = .none
    }
}
