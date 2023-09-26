//
//  UILabel+Extenstion.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 26.09.2023.
//

import Foundation
import UIKit

extension UILabel {
    static func setupCustomLabel(text: String, fontSize: UIFont) -> UILabel {
        let customLabel = UILabel()
        customLabel.text = text
        customLabel.textColor = #colorLiteral(red: 0.4863581657, green: 0.4862256646, blue: 0.4821705818, alpha: 1)
        customLabel.font = fontSize
        return customLabel
    }
}
