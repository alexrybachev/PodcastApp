//
//  CreateAccauntViewController.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import UIKit

final class CreateAccauntViewController: UIViewController {
    
    // MARK: - Private Properties
    private let createAccView = CreateAccauntView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createAccView)
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        createAccView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
