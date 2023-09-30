//
//  OnboardingViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
   lazy var completedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Onboarding finished!", for: .normal)
        button.addTarget(nil, action: #selector(finishOnboarding), for: .touchUpInside)
        button.backgroundColor = .systemGray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setViews()
        setConstraints()
    }
    
    //MARK: - Methods
   private func setViews() {
       view.backgroundColor = .systemTeal
       view.addSubview(completedButton)
    }
    
    private  func setConstraints() {
        completedButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func finishOnboarding() {
        AppSettingsManager.setCompleted()
        let tabBarVC = CustomTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }

}
