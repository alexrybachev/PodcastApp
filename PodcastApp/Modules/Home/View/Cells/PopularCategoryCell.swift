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
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
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
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.cornerRadius = 10
        
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)

    }
    
    private func setConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(6)
        }
    }
    
    // MARK: - Configure
    
    func configureCell(_ title: String) {
        headerLabel.text = title
    }
}
