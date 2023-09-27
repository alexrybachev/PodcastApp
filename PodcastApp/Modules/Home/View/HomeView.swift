//
//  HomeView.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 25.09.2023.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    // MARK: - UI Elements
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Abigael Amaniah"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var userSloganLabel: UILabel = {
        let label = UILabel()
        label.text = "Love, life and chill"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var userAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.9864392877, green: 0.8254926801, blue: 0.8242263198, alpha: 1)
        imageView.layer.cornerRadius = 16
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = CGSize(width: 1, height: 5)
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.isScrollEnabled = false
        return collectionView
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
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        addSubview(userNameLabel)
        addSubview(userSloganLabel)
        addSubview(userAvatar)
        
        collectionView.register(HomeViewSectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HomeViewSectionHeader.reuseID)
        
        collectionView.register(CategoryHomeViewCell.self,
                                forCellWithReuseIdentifier: CategoryHomeViewCell.cellID)
        collectionView.register(PopularCategoryCell.self, 
                                forCellWithReuseIdentifier: PopularCategoryCell.cellID)
        collectionView.register(PodcastHomeViewCell.self,
                                forCellWithReuseIdentifier: PodcastHomeViewCell.cellID)
        
        addSubview(collectionView)
    }
    
    private func setConstraints() {
        userAvatar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(50)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(userAvatar.snp.top)
        }
        
        
        userSloganLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(userAvatar.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    
}

// MARK: - Public Methods

extension HomeView {
    
    public func setupCompositionalLayout(layout: UICollectionViewLayout) {
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    public func transferDelegates(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
    
    public func reloadCollectionView() {
        collectionView.reloadData()
    }
    
}
