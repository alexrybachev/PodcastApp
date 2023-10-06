//
//  AuthColor.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 27.09.2023.
//

import Foundation
import UIKit

extension UIColor {
    static var customBlue: UIColor {
        UIColor(named: "CustomBlueColor") ?? .clear
    }
    
    static var customPurple: UIColor {
        UIColor(named: "CustomPurpleColor") ?? .clear
    }
    
    static var customGreen: UIColor {
        UIColor(named: "CustomGreenColor") ?? .clear
    }
    
    static var grayLabelColor: UIColor {
        UIColor(named: "GrayLabelColor") ?? .clear
    }
    
    static var textFieldColorOne: UIColor {
        UIColor(named: "TextFieldColorOne") ?? .clear
    }
    
    static var textFieldColorTwo: UIColor {
        UIColor(named: "TextFieldColorTwo") ?? .clear
    }
    
    static var placeholderColor: UIColor {
        UIColor(named: "PlaceholderColor") ?? .clear
    }
}

// Рандомный цвет
extension UIColor {
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 0.6)
    }
}
