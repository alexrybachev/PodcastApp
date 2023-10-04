//
//  PlayingNowViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

final class PlayingNowViewController: UIViewController {
    
    // MARK: - Private Properties
    private var currentPage = 0
    
    private var pageSize: CGSize {
        let layout = playingNowView.mainCollectionView.collectionViewLayout as! CustomCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    // MARK: - Private UI Properties
    private let playingNowView = PlayingNowView()
    private let colors = [UIColor.red, UIColor.green, UIColor.brown, UIColor.blue]
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupConstraints()
        setupNavigationBar()
        playingNowView.transferDelegates(dataSource: self, delegate: self)
        
        playingNowView.nextButton.addTarget(self, action: #selector(scrollToNextOrPreviousCell), for: .touchUpInside)
        playingNowView.backButton.addTarget(self, action: #selector(scrollToNextOrPreviousCell), for: .touchUpInside)
    }
    
    // MARK: - Private Actions
    @objc private func scrollToNextOrPreviousCell(_ sender: UIButton) {
        let contentOffset = playingNowView.mainCollectionView.contentOffset
        let cellSize = playingNowView.layout.itemSize
        let numberOfItems = playingNowView.mainCollectionView.numberOfItems(inSection: 0)
        let currentItemIndex = Int(round(contentOffset.x / cellSize.width))
        var currentIndexPath = IndexPath()
        
        if sender == playingNowView.nextButton {
            if currentItemIndex < numberOfItems - 1 {
                currentIndexPath = IndexPath(item: currentItemIndex + 1, section: 0)
            } else {
                // Если уже на последней ячейке, не изменяем индекс
                currentIndexPath = IndexPath(item: currentItemIndex, section: 0)
            }
        } else {
            if currentItemIndex > 0 {
                currentIndexPath = IndexPath(item: currentItemIndex - 1, section: 0)
            } else {
                // Если уже на первой ячейке, не изменяем индекс
                currentIndexPath = IndexPath(item: currentItemIndex, section: 0)
            }
        }
        
        playingNowView.mainCollectionView.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func rightBarButtonDidTapped() {
    }

    // MARK: - Privaet Methods
    private func addViews() {
        view.addSubview(playingNowView)
    }
    
    private func setupConstraints() {
        playingNowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        title = "Now playing"
        
        let rightBarButton = UIBarButtonItem(
            image: UIImage(named: "playlistIcon"),
            style: .done,
            target: self,
            action: #selector(rightBarButtonDidTapped)
        )
        
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

// MARK: - UICollectionViewDataSource
extension PlayingNowViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PodcastImageCell.reuseId,
                for: indexPath) as? PodcastImageCell
        else {
            return  UICollectionViewCell()
        }
        cell.configureView(with: colors[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PlayingNowViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        playingNowView.mainCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
}

// MARK: - UIScrollViewDelegate
extension PlayingNowViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = playingNowView.mainCollectionView.collectionViewLayout as! CustomCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
}
