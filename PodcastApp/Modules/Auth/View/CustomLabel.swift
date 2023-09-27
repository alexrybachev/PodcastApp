//
//  CustomLabel.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 27.09.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    // MARK: - Init
    init(title: String, font: UIFont, color: UIColor) {
        super.init(frame: .zero)
        self.text = title
        self.font = font
        self.textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
