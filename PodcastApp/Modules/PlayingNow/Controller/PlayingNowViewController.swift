//
//  PlayingNowViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

final class PlayingNowViewController: UIViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: - Private Actions
    @objc private func rightBarButtonDidTapped() {
        
    }
    // MARK: - Privaet Methods
    private func addViews() {
        
    }
    private func setupConstraints() {
        
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
