//
//  SearchResultViewCell.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 28.09.2023.
//

import UIKit

class SearchResultViewCell: UICollectionViewCell {
    
    static let cellID = String(describing: SearchResultViewCell.self)
    
    // MARK: - Private Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = #colorLiteral(red: 0.5890501738, green: 0.8443468809, blue: 0.9490881562, alpha: 1)
        return imageView
    }()
    
    private lazy var podcastLabel: UILabel = {
        let label = UILabel()
        label.text = "podcastLabel"
        label.font = .custome(name: .manrope700, size: 14)
        return label
    }()
    
    private lazy var podcastSubLabel: UILabel = {
        let label = UILabel()
        label.text = "podcastSubLabel"
        label.font = .custome(name: .manrope400, size: 12)
        return label
    }()
    
    
    // MARK: - Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup UI
    
    private func setHierarchy() {
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = #colorLiteral(red: 0.927100718, green: 0.9409192204, blue: 0.9886890054, alpha: 1)
        
        contentView.addSubview(imageView)
        contentView.addSubview(podcastLabel)
        contentView.addSubview(podcastSubLabel)
        
    }
    
    private func setConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
        
        podcastLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview().inset(12)
        }
        
        podcastSubLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.top.equalTo(podcastLabel.snp.bottom).offset(12)
        }
        
    }
    
    // MARK: - Configure
    
    func configureCell(_ podcast: PodcastInfo) {
        print("реализовать настройку ячейки")
    }
}
