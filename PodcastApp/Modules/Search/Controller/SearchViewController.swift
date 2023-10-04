//
//  SearchViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

enum SearchSection {
    case topGenres
    case browseAll
}

class SearchViewController: UIViewController {

    private let searchView = SearchView()
    
    private var categoryList: SearchedResult?
    private var searchResult: SearchPodcats?

    private var isSearched = false
    
    // MARK: - Initial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view = searchView
        searchView.transferDelegates(dataSource: self, delegate: self)
        searchView.setupCompositionalLayout(layout: createInitialCompositionalLayout())
        searchView.transferSearchBarDelegate(delegate: self)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        fetchCategoryList()
//    }

}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        isSearched ? 1 : 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return isSearched
            ? (searchResult?.feeds?.count ?? 0)
            : CategoryList.getAllCategories().count
        default:
            return CategoryList.getAllCategories().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch isSearched {
        case false:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewCell.cellID, for: indexPath) as! SearchViewCell
            cell.configureCell(CategoryList.getAllCategories()[indexPath.item])
            cell.contentView.backgroundColor = UIColor.random
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultViewCell.cellID, for: indexPath) as! SearchResultViewCell
            let podcast = searchResult?.feeds?[indexPath.item]
            cell.configureCell(podcast)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: HomeViewSectionHeader.reuseID,
                                                                         for: indexPath) as! HomeViewSectionHeader
        switch indexPath.section {
        case 0:
            headerView.configureHeader(with: "Top Genres", and: false)
        default:
            headerView.configureHeader(with: "Browse All")
        }
        
        return headerView
    }
    
}

// MARK: - UICollectionViewCompositionalLayout

extension SearchViewController {
    
    private func createInitialCompositionalLayout() -> UICollectionViewLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
               return self?.createFirstSection()
            default:
               return self?.createSecondSection()
            }
        }
    }
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .absolute(84))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
//        item.edgeSpacing = .init(leading: .fixed(8), top: .none, trailing: .fixed(8), bottom: .none)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .none, trailing: .none, bottom: .fixed(16))
//        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
                
        return section
    }
    
    private func createSearchResultCompositionalLaypout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .none, trailing: .none, bottom: .fixed(8))
//        group.interItemSpacing = .fixed(16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

// MARK: - UICollectionViewDelegate

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if isSearched {
                let podcast = searchResult?.feeds?[indexPath.item]
                let channelVC = ChannelViewController(podcast: podcast)
                navigationController?.pushViewController(channelVC, animated: true)
            } else {
                let category = CategoryList.getAllCategories()[indexPath.item]
                fetchPodcasts(for: category)
            }
        default:
            if !isSearched {
                let category = CategoryList.getAllCategories()[indexPath.item]
                fetchPodcasts(for: category)
            }
        }
    }
}


// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        print(#function)
        searchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(#function)
        if searchText.isEmpty {
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        if let searchText = searchBar.text, !searchText.isEmpty {
            isSearched.toggle()
            fetchSearchResult(for: searchText)
            searchView.setupCompositionalLayout(layout: createSearchResultCompositionalLaypout()) // меняем composition layout
            searchBar.resignFirstResponder()
        }
        searchView.reloadCollectionView() // перезагружаем коллекцию
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        if isSearched {
            isSearched.toggle()
            searchBar.text = nil
            searchView.setupCompositionalLayout(layout: createInitialCompositionalLayout()) // возвращаем compitional layout
            searchBar.resignFirstResponder()
        }
        searchView.reloadCollectionView() // перезагружаем коллекцию
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
}

// MARK: - Networking

extension SearchViewController {
    
//    private func fetchCategoryList() {
//        NetworkManager.shared.fetchCategoryList { [weak self] result in
//            switch result {
//            case .success(let data):
//                self?.categoryList = data
//                self?.searchView.reloadCollectionView()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    private func fetchSearchResult(for searchText: String) {
        NetworkManager.shared.searchPodcasts(with: searchText) { [weak self] result in
            switch result {
            case .success(let data):
                self?.searchResult = data
                self?.searchView.reloadCollectionView()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchPodcasts(for category: String) {
        NetworkManager.shared.fetchTrendingPodcast(for: category) { [weak self] result in
            switch result {
            case .success(let data):
                let podcast = data.feeds?.randomElement()
                let channelVC = ChannelViewController(podcast: podcast)
                self?.navigationController?.pushViewController(channelVC, animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
