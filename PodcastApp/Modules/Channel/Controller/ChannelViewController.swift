//
//  ChannelViewController.swift
//  PodcastApp
//
//  Created by Admin on 26.09.2023.
//

import UIKit
import SnapKit

class ChannelViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Channel"
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    private let imageChanel: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .cyan
        image.layer.cornerRadius = 84/4
        return image
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Channel"
//        navigationController?.navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font: UIFont(name: "manrope-light", size: 16)
//        ]
        self.view.backgroundColor = .white
        setupViews()
        makeConstraints()
    }
    
    private func setupViews(){
        view.addSubview(titleLabel)
        view.addSubview(imageChanel)
    }
    
    private func makeConstraints(){
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        imageChanel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(113)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(84)
        }
    }
    
    
}
