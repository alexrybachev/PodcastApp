//
//  OnboardingViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit


final class OnboardingViewController: UIViewController {
    
//   lazy var completedButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Onboarding finished!", for: .normal)
//        button.addTarget(nil, action: #selector(finishOnboarding), for: .touchUpInside)
//        button.backgroundColor = .systemGray
//        return button
//    }()
    
    private lazy var secondView: UIView = {
        var secondView = UIView()
        secondView.backgroundColor = #colorLiteral(red: 0.6869879365, green: 0.8190694451, blue: 0.9799563289, alpha: 1)
        secondView.layer.cornerRadius = 30
        return secondView
    }()
    
    private lazy var pageControl: UIPageControl = {
        var pageControll = UIPageControl()
        pageControll.numberOfPages = 3
        pageControll.currentPageIndicatorTintColor = .black
        return pageControll
    }()
    
    private lazy var nextButton: UIButton = {
        var nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.9257928729, green: 0.9576769471, blue: 0.9981418252, alpha: 1)
        nextButton.layer.cornerRadius = 20
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return nextButton
    }()
    
    private lazy var skipButton: UIButton = {
        var skipButton = UIButton(type: .system)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        skipButton.setTitleColor(.black, for: .normal)
        return skipButton
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(secondView)
        secondView.addSubview(pageControl)
        secondView.addSubview(nextButton)
        secondView.addSubview(skipButton)
        setupConstraints()
//        view.backgroundColor = .systemTeal
//        setViews()
//        setConstraints()
    }
    
    
    // MARK: - Private Methods
    private func setupConstraints() {
        secondView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.left.equalToSuperview().offset(27)
            make.right.equalToSuperview().offset(-27)
            make.height.equalTo(380)
        }
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-20)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(85)
            make.height.equalTo(58)
        }
        
        skipButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-20)
            make.centerY.equalTo(nextButton.snp.centerY)
            make.left.equalToSuperview().offset(30)
//            make.width.equalTo(85)
//            make.height.equalTo(58)
        }
        
    }
    
    //MARK: - Methods
//   private func setViews() {
//       view.backgroundColor = .systemTeal
//       view.addSubview(completedButton)
//    }
    
//    private  func setConstraints() {
//        completedButton.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
//    }
    
//    @objc func finishOnboarding() {
//        AppSettingsManager.setCompleted()
//        let tabBarVC = CustomTabBarController()
//        tabBarVC.modalPresentationStyle = .fullScreen
//        present(tabBarVC, animated: true)
//    }

}

