//
//  PopularCategoryCell.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 25.09.2023.
//

import UIKit

class PopularCategoryCell: UICollectionViewCell {
    
    static let cellID = String(describing: PopularCategoryCell.self)
    
    //MARK: - UI Elements
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Category"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - LifeCycle
    
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
        contentView.addSubview(headerLabel)
        contentView.backgroundColor = .purple
        contentView.layer.cornerRadius = 10
    }
    
    private func setConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(6)
        }
    }
    
}
