//
//  ChannelViewCell.swift
//  PodcastApp
//
//  Created by Admin on 27.09.2023.
//

import UIKit

class ChannelViewCell: UITableViewCell {
    
    let imageEpizode: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 56/4
        return image
    }()
    
    let nameEpizode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    let totalTimeEpizodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    let numberOfEpizode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    let separateLabel: UILabel = {
        let label = UILabel()
        label.text = " | "
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        addSubview(imageEpizode)
        addSubview(nameEpizode)
        addSubview(totalTimeEpizodeLabel)
        addSubview(numberOfEpizode)
        addSubview(separateLabel)
                
        imageEpizode.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.width.height.equalTo(56)
        }
        
        nameEpizode.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        
        numberOfEpizode.snp.makeConstraints { (make) in
            make.top.equalTo(nameEpizode.snp.bottom).offset(5)
            make.leading.equalTo(nameEpizode.snp.leading)
        }
        
        separateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numberOfEpizode.snp.top)
            make.leading.equalTo(numberOfEpizode.snp.trailing).offset(5)
        }
        
        totalTimeEpizodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numberOfEpizode.snp.top)
            make.leading.equalTo(separateLabel.snp.trailing).offset(5)
        }
    }
    
    func configure(channel: Channel){
        nameEpizode.text = channel.name
        totalTimeEpizodeLabel.text = channel.totalTime
        numberOfEpizode.text = channel.numberOfEpizode
        imageEpizode.backgroundColor = channel.image
    }
}
