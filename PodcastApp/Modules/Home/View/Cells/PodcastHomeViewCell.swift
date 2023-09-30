//
//  HomeViewCell.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 25.09.2023.
//

import UIKit
import Kingfisher

class PodcastHomeViewCell: UICollectionViewCell {
    
    static let cellID = String(describing: PodcastHomeViewCell.self)
    
    // MARK: - Private Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.5890501738, green: 0.8443468809, blue: 0.9490881562, alpha: 1)
        return imageView
    }()
    
    private lazy var podcastLabel: UILabel = {
        let label = UILabel()
        label.text = "podcastLabel"
        label.numberOfLines = 0
        label.font = .custome(name: .manrope700, size: 14)
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "authorLabel"
        label.numberOfLines = 0
        label.font = .custome(name: .manrope400, size: 12)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var podcastSubLabel: UILabel = {
        let label = UILabel()
        label.text = "podcastSubLabel"
        label.numberOfLines = 0
        label.font = .custome(name: .manrope400, size: 12)
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .gray
        return button
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
        contentView.addSubview(likeButton)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(podcastLabel)
        stackView.addArrangedSubview(authorLabel)
        
//        contentView.addSubview(podcastLabel)
//        contentView.addSubview(authorLabel)
        contentView.addSubview(podcastSubLabel)
        
    }
    
    private func setConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(8)
            make.width.equalTo(19)
            make.height.equalTo(17)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.trailing.equalTo(likeButton.snp.leading).offset(-12)
        }
        
//        podcastLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(12)
//            make.leading.equalTo(imageView.snp.trailing).offset(12)
////            make.trailing.equalTo(authorLabel.snp.leading).offset(-12)
//            make.width.equalTo((contentView.frame.width - 105) / 2)
//        }
//        
//        authorLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(12)
////            make.leading.equalTo(podcastLabel.snp.trailing).offset(12)
//            make.trailing.equalTo(likeButton.snp.leading).offset(-12)
//            make.width.equalTo((contentView.frame.width - 105) / 2)
//        }
        
        podcastSubLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(12)
//            make.top.equalTo(podcastLabel.snp.bottom).offset(12)
            make.top.equalTo(stackView.snp.bottom).offset(12)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
        
    }
    
    // MARK: - Configure
    
    func configureCell(_ podcast: Podcast?) {
        podcastLabel.text = podcast?.title ?? ""
        authorLabel.text = podcast?.author ?? ""
        podcastSubLabel.text = podcast?.categoriesLabel ?? ""
        
        guard let url = podcast?.image else { return }
        let cache = ImageCache.default
        cache.diskStorage.config.expiration = .seconds(1)
        let processor = RoundCornerImageProcessor(cornerRadius: 12, backgroundColor: .clear)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: url), placeholder: nil, options: [.processor(processor),                                           .cacheSerializer(FormatIndicatedCacheSerializer.png)])
    }
}
