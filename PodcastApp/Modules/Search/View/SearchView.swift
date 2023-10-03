//
//  SearchView.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 28.09.2023.
//

import UIKit

class SearchView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
//        searchBar.showsCancelButton = true
        searchBar.placeholder = "Podcast, channel or artists"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        return collection
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
        addSubview(searchBar)
        addSubview(collectionView)
        
        collectionView.register(HomeViewSectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HomeViewSectionHeader.reuseID)
        
        collectionView.register(SearchViewCell.self,
                                forCellWithReuseIdentifier: SearchViewCell.cellID)
        
        collectionView.register(SearchResultViewCell.self,
                                forCellWithReuseIdentifier: SearchResultViewCell.cellID)
    }
    
    private func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(superview?.safeAreaLayoutGuide.snp.top ?? self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superview?.safeAreaLayoutGuide.snp.leading ?? self.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(superview?.safeAreaLayoutGuide.snp.trailing ?? self.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }

}

// MARK: - Public Methods

extension SearchView {
    
    // Collection View
    
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
    
    public func reloadSection(for indexSection: Int) {
        collectionView.reloadSections(IndexSet(integer: indexSection))
    }
    
    // Search Bar
    
    public func transferSearchBarDelegate(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
    
    public func searchBarEditing() {
        searchBar.showsCancelButton = true
    }
    
}
