//
//  HomeViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    // MARK: - Initial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        homeView.transferDelegates(dataSource: self, delegate: self)
        homeView.setupCompositionalLayout(layout: createInitialCompositionalLayout())
//        setHierarchy()
//        setConstraints()
    }
    
    // MARK: - Setup UI
    
    private func setHierarchy() {
//        view.addSubview(homeView)
    }
    
    private func setConstraints() {
//        homeView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryHomeViewCell.cellID, for: indexPath) as! CategoryHomeViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCategoryCell.cellID, for: indexPath) as! PopularCategoryCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PodcastHomeViewCell.cellID, for: indexPath) as! PodcastHomeViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: HomeViewSectionHeader.reuseID,
                                                                             for: indexPath) as! HomeViewSectionHeader
            return headerView
    }
    
    
}

// MARK: - UICollectionViewCompositionalLayout

extension HomeViewController {
    
    private func createInitialCompositionalLayout() -> UICollectionViewLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                self?.createFirstSection()
            case 1:
                self?.createSecondSection()
            default:
                self?.createThirdSection()
            }
        }
    }
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
                
        return section
    }
    
    private func createThirdSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84)) // fractionalHeight(1)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)) // absolute(72)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("section: \(indexPath.section) - item: \(indexPath.item)")
    }
}

