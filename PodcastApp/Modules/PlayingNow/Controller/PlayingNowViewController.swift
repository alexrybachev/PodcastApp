//
//  PlayingNowViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

final class PlayingNowViewController: UIViewController {
    
    var itemW: CGFloat {
        return screenWidth * 0.4
    }
    
    var itemH: CGFloat {
        return itemW * 1.45
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(item: 1, section: 0)
        playingNowView.mainCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        playingNowView.layout.currentPage = indexPath.item
        playingNowView.layout.previousOffset = playingNowView.layout.updateOffSet(playingNowView.mainCollectionView)
        
        if let cell = playingNowView.mainCollectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    
    // MARK: - Private Actions
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
        if indexPath.item == playingNowView.layout.currentPage {
            
        } else {
            playingNowView.mainCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            playingNowView.layout.currentPage = indexPath.item
            playingNowView.layout.previousOffset = playingNowView.layout.updateOffSet(playingNowView.mainCollectionView)
            setupCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PlayingNowViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        collectionView.frame.size
        return CGSize(width: itemW, height: itemH)
        
    }
}

// MARK: - UIScrollViewDelegate
extension PlayingNowViewController {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            setupCell()
        }
    }
    
    private func setupCell() {
        let indexPath = IndexPath(item: playingNowView.layout.currentPage, section: 0)
        if let cell = playingNowView.mainCollectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    
    private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true) {
        if !isEffect {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            return
        }
        
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        
        for otherCell in playingNowView.mainCollectionView.visibleCells {
            if let indexPath = playingNowView.mainCollectionView.indexPath(for: otherCell) {
                if indexPath.item != playingNowView.layout.currentPage {
                    UIView.animate(withDuration: 0.2) {
                        otherCell.transform = .identity
                    }
                }
            }
        }
    }
}

