//
//  ProfileSettingsViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

class ProfileSettingsViewController: UIViewController {
    
    // MARK: - Properties
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(red: 0.99, green: 0.83, blue: 0.82, alpha: 1)
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowRadius = 8
        image.layer.shadowOpacity = 0.4
        image.layer.shadowOffset = CGSize(width: 1, height: 5)
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    private let nameAndSecondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Abigael Amaniah"
        label.font = .custome(name: .manrope700, size: 16)
        label.textColor = UIColor(red: 0.26, green: 0.25, blue: 0.32, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private let quoteLabel: UILabel = {
        let element = UILabel()
        element.text = "Love,life and chill"
        element.font = .custome(name: .manrope700, size: 12)
        element.textColor = UIColor(red: 0.64, green: 0.63, blue: 0.69, alpha: 1)
        element.numberOfLines = 1
        return element
    }()
    
    private let logoutButton: UIButton = {
        let element = UIButton()
        element.setTitle("Log Out", for: .normal)
        element.titleLabel?.font = .custome(name: .manrope700, size: 16)
        element.setTitleColor(UIColor(red: 0.16, green: 0.51, blue: 0.95, alpha: 1), for: .normal)
        element.layer.cornerRadius = 32
        element.layer.borderWidth = 1
        element.layer.borderColor = UIColor(red: 0.16, green: 0.51, blue: 0.95, alpha: 1).cgColor
        return element
    }()
    
    private let accountSettingsButton = ProfileCustomButton(nameButton: "Account Setting", image: UIImage(systemName: "person")!)
    
    private let changePasswordButton = ProfileCustomButton(nameButton: "Change Password", image: UIImage(systemName: "checkmark.shield")!)
    
    private let forgetPasswordButton = ProfileCustomButton(nameButton: "Forget Password", image: UIImage(systemName: "lock.open")!)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        addTargets()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: - SetupView
    private func setupView(){
        view.addSubview(profileImage)
        view.addSubview(nameAndSecondNameLabel)
        view.addSubview(quoteLabel)
        view.addSubview(accountSettingsButton)
        view.addSubview(changePasswordButton)
        view.addSubview(forgetPasswordButton)
        view.addSubview(logoutButton)
    }
    // MARK: - Targets
    private func addTargets(){
        accountSettingsButton.addTarget(self, action: #selector(accountSettingsButtonTapped), for: .touchUpInside)
        changePasswordButton.addTarget(self, action: #selector(changePasswordButtonTapped), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordButtonTapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
    }
    // MARK: - Constraints
    private func setupConstraints(){
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(56)
            make.leading.equalToSuperview().offset(32)
            make.width.height.equalTo(48)
        }
        
        nameAndSecondNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage).offset(1)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(32)
        }
        
        quoteLabel.snp.makeConstraints { make in
            make.top.equalTo(nameAndSecondNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(nameAndSecondNameLabel)
        }
        
        accountSettingsButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(32)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        changePasswordButton.snp.makeConstraints { make in
            make.top.equalTo(accountSettingsButton.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(changePasswordButton.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(112)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(60)
        
        }
    }
    // MARK: - Objc Methods
    @objc private func accountSettingsButtonTapped(){
//        let vc = AccountSettingsViewController()
//        navigationController?.pushViewController(vc, animated: true)
        print("AccountSettingsButtonTapped")
    
    }
    
    @objc private func changePasswordButtonTapped(){
        print("ChangePasswordButtonTapped")
    

    }
    
    @objc private func forgetPasswordButtonTapped(){
        print("ForgetPasswordButtonTapped")
    }
    
    @objc private func logoutButtonTapped(){
        print("LogoutButtonTapped")
    }
    

}

