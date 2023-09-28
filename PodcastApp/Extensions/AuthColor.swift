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
    
    static var customLabelColor: UIColor {
        UIColor(named: "CustomLabelColor") ?? .clear
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
