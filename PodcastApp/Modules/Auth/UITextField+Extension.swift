//
//  UITextField+Extension.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 25.09.2023.
//

import Foundation
import UIKit

extension UITextField {
    static func createCustomTextField(placeholder: String) -> UITextField {
        let customTF = UITextField()
        
        // устанавливаем цвет текста в placeholder
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        customTF.attributedPlaceholder = placeholderText
        
        // создаем отступ от левого края textField
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        customTF.leftView = leftView
        customTF.leftViewMode = .always
        
        return customTF
    }
}
