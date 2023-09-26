//
//  UIButton+Extensions.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import Foundation
import UIKit

extension UIButton {
    static func createGoogleButton() -> UIButton {
        let googleButton = UIButton(type: .custom)
        googleButton.layer.borderColor = UIColor.black.cgColor
        googleButton.layer.borderWidth = 1
        googleButton.layer.cornerRadius = 24
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "google")
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = "Continue with Google"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        googleButton.addSubview(imageView)
        googleButton.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.right.equalTo(label.snp.left).offset(-10)
            make.centerY.equalTo(googleButton.snp.centerY)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.equalTo(googleButton.snp.trailing).offset(-60)
            make.centerY.equalTo(googleButton.snp.centerY)
        }
        
        return googleButton
    }
    
    func createDefaultButton(text: String, cornerRadius: Int) -> UIButton {
        let logButton = UIButton(type: .system)
        logButton.setTitle(text, for: .normal)
        logButton.backgroundColor = #colorLiteral(red: 0.1589552164, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        logButton.layer.cornerRadius = CGFloat(cornerRadius)
        logButton.tintColor = .white
        logButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return logButton
    }
}
