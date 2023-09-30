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
        label.font = UIFont(name: "manrope-medium", size: 14)
        label.textColor = .black
        return label
    }()
    
    let totalTimeEpizodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "manrope-medium", size: 14)
        label.textColor = .black
        return label
    }()
    
    let numberOfEpizode: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "manrope-medium", size: 14)
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
    
    let backgroundCellView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9434495568, green: 0.9541783929, blue: 0.9908102155, alpha: 1)
        view.layer.cornerRadius = 72/4
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    private func setupCell(){
        contentView.addSubview(backgroundCellView)
        contentView.addSubview(imageEpizode)
        contentView.addSubview(nameEpizode)
        contentView.addSubview(totalTimeEpizodeLabel)
        contentView.addSubview(numberOfEpizode)
        contentView.addSubview(separateLabel)
        
        
//        contentView.backgroundColor = #colorLiteral(red: 0.9434495568, green: 0.9541783929, blue: 0.9908102155, alpha: 1)
//        contentView.layer.cornerRadius = 72/4
//        
//        contentView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(32)
//            make.trailing.equalToSuperview().inset(32)
//            make.height.equalTo(72)
//        }
        
        backgroundCellView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(32)
            make.trailing.equalTo(contentView.snp.trailing).inset(32)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        imageEpizode.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundCellView.snp.centerY)
            make.leading.equalTo(backgroundCellView.snp.leading).offset(8)
            make.width.height.equalTo(56)
        }
        
        nameEpizode.snp.makeConstraints { make in
            make.top.equalTo(backgroundCellView.snp.top).offset(15)
            make.leading.equalTo(imageEpizode.snp.trailing).offset(19)
        }
        
        numberOfEpizode.snp.makeConstraints { make in
            make.top.equalTo(nameEpizode.snp.bottom).offset(5)
            make.leading.equalTo(nameEpizode.snp.leading)
        }
        
        separateLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfEpizode.snp.top)
            make.leading.equalTo(numberOfEpizode.snp.trailing).offset(5)
        }
        
        totalTimeEpizodeLabel.snp.makeConstraints { make in
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
