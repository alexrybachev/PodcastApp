//
//  GoogleButton.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 29.09.2023.
//

import UIKit
import GoogleSignIn

final class GoogleButton: GIDSignInButton {
    
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        self.style = .iconOnly
      
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 24

            let imageView = UIImageView()
            imageView.image = UIImage(named: "google")
            imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            imageView.contentMode = .scaleAspectFit

            let label = UILabel()
            label.text = "Continue with Google"
            label.textColor = .black
            label.font = UIFont.custome(name: .plusJakartaSans600, size: 16)
            label.textAlignment = .center

            self.addSubview(imageView)
            self.addSubview(label)

            imageView.snp.makeConstraints { make in
                make.right.equalTo(label.snp.left).offset(-10)
                make.centerY.equalTo(self.snp.centerY)
                make.width.equalTo(30)
                make.height.equalTo(30)
            }

            label.snp.makeConstraints { make in
                make.leading.equalTo(imageView.snp.trailing).offset(10)
                make.trailing.equalTo(self.snp.trailing).offset(-60)
                make.centerY.equalTo(self.snp.centerY)
            }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
