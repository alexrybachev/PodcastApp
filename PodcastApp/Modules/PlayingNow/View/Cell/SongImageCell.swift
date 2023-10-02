//
//  SongImageCell.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 02.10.2023.
//

import UIKit

final class SongImageCell: UICollectionViewCell {
    
//    private var imageView = UIImageView()
    
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.layer.cornerRadius = 25
        return mainView
    }()
  

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainView)
        setupConstraints()
//        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configureView(with color: UIColor) {
        mainView.backgroundColor = color
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
    }
    
    
}
