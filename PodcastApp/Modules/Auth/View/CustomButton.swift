//
//  CustomButton.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 27.09.2023.
//

import UIKit

class CustomButton: UIButton {
    
    enum CustomButtonType {
        case blueButton
        case googleButton
        case smallButton
    }
    
    init(title: String,font: UIFont, buttonType: CustomButtonType) {
        super.init(frame: .zero)
        
   
        
        switch buttonType {
            
        case .blueButton:
            self.backgroundColor = #colorLiteral(red: 0.1589552164, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
            self.layer.cornerRadius = 25
            self.tintColor = .white
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            self.setTitle(title, for: .normal)
            
        case .googleButton:
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 24
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "google")
            imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            imageView.contentMode = .scaleAspectFit
            
            let label = UILabel()
            label.text = title
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 18)
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
            
            
        case .smallButton:
            self.titleLabel?.font = font
            self.setTitle(title, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
