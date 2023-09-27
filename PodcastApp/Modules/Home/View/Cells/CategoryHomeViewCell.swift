//
//  CategoryHomeViewCell.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 25.09.2023.
//

import UIKit

class CategoryHomeViewCell: UICollectionViewCell {
    
    static let cellID = String(describing: CategoryHomeViewCell.self)
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var categotyView: UIView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = #colorLiteral(red: 0.8453942537, green: 0.9395052195, blue: 0.981569469, alpha: 1)
        blurView.frame = view.bounds
        view.addSubview(blurView)
        return view
    }()
    
    private lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.text = "categoryTitle"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var categorySubtitle: UILabel = {
        let label = UILabel()
        label.text = "categorySubtitle"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup UI
    
    private func setHierarchy() {
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.backgroundColor = #colorLiteral(red: 0.5890501738, green: 0.8443468809, blue: 0.9490881562, alpha: 1)
        
        contentView.addSubview(imageView)
        
        contentView.addSubview(categotyView)
        categotyView.addSubview(categoryTitle)
        categotyView.addSubview(categorySubtitle)

    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        categotyView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        categoryTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
//            make.top.equalTo(categotyView.snp.top).inset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        categorySubtitle.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(categoryTitle.snp.bottom).offset(10)
        }
    }
    
}
