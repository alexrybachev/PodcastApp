//
//  SongImageCell.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 02.10.2023.
//

import UIKit

final class PodcastImageCell: UICollectionViewCell {
    
    static let reuseId = String(describing: PodcastImageCell.self)
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.layer.cornerRadius = 25
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowPath = UIBezierPath(rect: mainView.bounds).cgPath
        mainView.layer.shouldRasterize = true
        return mainView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configureView(with color: UIColor) {
        mainView.backgroundColor = color
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.left.equalToSuperview().offset(40)
//            make.right.equalToSuperview().offset(-40)
        }
    }
}
