//
//  PlayingNowView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 02.10.2023.
//

import UIKit

final class PlayingNowView: UIView {
    
    // MARK: - Private UI Properties
    private var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let myCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        myCV.backgroundColor = .red
        myCV.isPagingEnabled = true
        myCV.showsHorizontalScrollIndicator = false
        myCV.register(SongImageCell.self, forCellWithReuseIdentifier: "cell")
        
        return myCV
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func transferDelegates(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
           mainCollectionView.dataSource = dataSource
           mainCollectionView.delegate = delegate
       }
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(mainCollectionView)
    }
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(350)
        }
    }
}
