//
//  RegistrationViewController.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 26.09.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let registrView = RegistrationView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.addSubview(registrView)
        setupConstraints()
    }
    
    // MARK: - Private methods
    private func setupConstraints() {
        registrView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
