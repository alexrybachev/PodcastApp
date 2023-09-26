//
//  UIView+Extension.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import Foundation
import UIKit

extension UIView {
    static func createCustomView() -> UIView {
        let contView = UIView()
        
        let contWithLabel = UILabel()
        contWithLabel.text = "Or continue with"
        contWithLabel.font = UIFont.systemFont(ofSize: 14)
        contWithLabel.textColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        
        let leftView = UIView()
        leftView.backgroundColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        
        let rightView = UIView()
        rightView.backgroundColor = #colorLiteral(red: 0.4235294461, green: 0.4235294461, blue: 0.4235294461, alpha: 1)
        
        contView.addSubview(leftView)
        contView.addSubview(contWithLabel)
        contView.addSubview(rightView)
        
        contWithLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        leftView.snp.makeConstraints { make in
            make.right.equalTo(contWithLabel.snp.left).offset(-10)
            make.centerY.equalTo(contWithLabel.snp.centerY)
            make.width.equalTo(62)
            make.height.equalTo(1)
        }
        
        rightView.snp.makeConstraints { make in
            make.left.equalTo(contWithLabel.snp.right).offset(10)
            make.centerY.equalTo(contWithLabel.snp.centerY)
            make.width.equalTo(62)
            make.height.equalTo(1)
        }
        
        return contView
    }
    
    static func createViewForTF() -> UIView {
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return rightView
    }
    
    static func addSubviews(mainView: UIView, subviews: UIView...) {
        subviews.forEach { subview in
            mainView.addSubview(subview)
        }
    }
}
