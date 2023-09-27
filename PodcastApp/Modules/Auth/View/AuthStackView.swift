//
//  AuthStackView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 26.09.2023.
//

import UIKit

enum AuthType: String {
    case login = "Login"
    case register = "Register"
    
    var isLogin: Bool {
        return self == .login
    }
}

final class AuthStackView: UIStackView {
    
    // MARK: - Public Properties
    var authType: AuthType!
    var actionButton = UIButton()
    
    // MARK: - Init
    init(authType: AuthType) {
        super.init(frame: .zero)
        setupStackView(for: authType)
        self.authType = authType
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupStackView(for authType: AuthType) {
        self.axis = .horizontal
        self.spacing = 1
        self.alignment = .fill
        self.distribution = .fill
        
        let infoLabel = CustomLabel(
            title: authType.isLogin ? "Already have an account?" : "Don't have an account yet?",
            font: UIFont.systemFont(ofSize: authType.isLogin ? 16 : 13),
            color: authType.isLogin ? #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1) : #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        )
        
        actionButton = CustomButton(
            title: authType.isLogin ? "Login" : "Register",
            font: UIFont.systemFont(ofSize: authType.isLogin ? 16 : 13),
            buttonType: .smallButton,
            color: #colorLiteral(red: 0.7093204856, green: 0.7974258065, blue: 0.3607985973, alpha: 1)
        )
        
        self.addArrangedSubview(infoLabel)
        self.addArrangedSubview(actionButton)
    }
}
