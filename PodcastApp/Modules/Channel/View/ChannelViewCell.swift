//
//  ChannelViewCell.swift
//  PodcastApp
//
//  Created by Admin on 27.09.2023.
//

import UIKit

class ChannelViewCell: UITableViewCell {
    
    static var reuseID = String(describing: ChannelViewCell.self)
    
    let backgroundCellView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9434495568, green: 0.9541783929, blue: 0.9908102155, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    
    let imageEpizode: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 56/4
        return image
    }()
    
    let nameEpizode: UILabel = {
        let label = UILabel()
        label.font = .custome(name: .manrope700, size: 14)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let totalTimeEpizodeLabel: UILabel = {
        let label = UILabel()
        label.font = .custome(name: .manrope700, size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let numberOfEpizode: UILabel = {
        let label = UILabel()
        label.font = .custome(name: .manrope700, size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let separateLabel: UILabel = {
        let label = UILabel()
        label.text = " | "
        label.font = .custome(name: .manrope700, size: 14)
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
    
    override func layoutSubviews() {
//        super.layoutSubviews()
//        let margins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    private func setupCell(){
        contentView.addSubview(backgroundCellView)
        contentView.addSubview(imageEpizode)
        contentView.addSubview(nameEpizode)
        contentView.addSubview(totalTimeEpizodeLabel)
        contentView.addSubview(numberOfEpizode)
        contentView.addSubview(separateLabel)
        
        backgroundCellView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        
        
        imageEpizode.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundCellView)
            make.leading.equalTo(backgroundCellView).offset(8)
            make.width.height.equalTo(56)
        }
        
        nameEpizode.snp.makeConstraints { make in
            make.top.equalTo(backgroundCellView.snp.top).offset(15)
            make.leading.equalTo(imageEpizode.snp.trailing).inset(-19)
            make.trailing.equalTo(backgroundCellView).inset(16)
        }
        
        totalTimeEpizodeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameEpizode.snp.bottom).offset(5)
            make.leading.equalTo(nameEpizode)
            make.bottom.equalTo(backgroundCellView).inset(14)
        }
        
        separateLabel.snp.makeConstraints { make in
            make.top.equalTo(totalTimeEpizodeLabel)
            make.leading.equalTo(totalTimeEpizodeLabel.snp.trailing).offset(5)
        }
        
        numberOfEpizode.snp.makeConstraints { make in
            make.top.equalTo(totalTimeEpizodeLabel)
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
