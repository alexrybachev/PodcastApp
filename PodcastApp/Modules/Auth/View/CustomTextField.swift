//
//  CustomTextField.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 27.09.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case withEyeButton
        case withoutEyeButton
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType, placeholder: String, border: Bool) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        if border {
            self.layer.borderColor = #colorLiteral(red: 0.9294117689, green: 0.9294117093, blue: 0.9294117093, alpha: 1)
            self.layer.borderWidth = 1
            self.backgroundColor = #colorLiteral(red: 0.984313786, green: 0.984313786, blue: 0.9843136668, alpha: 1)
            
            let placeholderText = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)]
            )
            self.attributedPlaceholder = placeholderText
        }
        
        self.placeholder = placeholder
        self.backgroundColor = #colorLiteral(red: 0.964484036, green: 0.9729270339, blue: 0.9972267747, alpha: 1)
        self.layer.cornerRadius = 13
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        if fieldType == .withEyeButton {
            
            let rightView = UIView()
            rightView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
            
            let customEyeButton = UIButton(type: .custom)
            customEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            customEyeButton.frame = CGRect(x: 10, y: 10, width: 23, height: 20)
            customEyeButton.tintColor = #colorLiteral(red: 0.6980392337, green: 0.6980391741, blue: 0.6980391741, alpha: 1)
            
            customEyeButton.addTarget(
                self,
                action: #selector(toggleTextVisibility),
                for: .touchUpInside
            )
            
            rightView.addSubview(customEyeButton)
            self.rightView = rightView
            self.rightViewMode = .always
        } else {
            self.layer.cornerRadius = 25
        }
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.size.height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func toggleTextVisibility(_ sender: UIButton) {
        if let textField = sender.superview?.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            
            let image = textField.isSecureTextEntry
            ? UIImage(systemName: "eye.slash.fill")
            : UIImage(systemName: "eye.fill")
            
            sender.setImage(image, for: .normal)
        }
    }
    
}
