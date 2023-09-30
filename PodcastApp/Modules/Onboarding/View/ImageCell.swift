//
//  ImageCell.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 30.09.2023.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    var imageView = UIImageView() {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
