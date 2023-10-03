//
//  ProfileCustomButton.swift
//  PodcastApp
//
//  Created by Admin on 02.10.2023.
//

import UIKit

class ProfileCustomButton:UIButton {
    
    private let bacgrounForSimvols: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.99, alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let simvolImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    private let nameButtonLabel: UILabel = {
        let label = UILabel()
        label.font = .custome(name: .manrope700, size: 14)
        label.textColor = UIColor(red: 0.26, green: 0.25, blue: 0.32, alpha: 1)
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()
    
}
