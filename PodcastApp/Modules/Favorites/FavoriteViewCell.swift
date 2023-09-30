//
//  FavoriteViewCell.swift
//  PodcastApp
//
//  Created by Elizaveta Eremyonok on 29.09.2023.
//


import UIKit

class FavouriteChannelCell: UITableViewCell {
    
    static var reuseID = String(describing: FavouriteChannelCell.self)
    
    var channel: ChannelModel?
    
    // MARK: - User Interface
    
    private let favChannelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = UIColor(
            red: 0.93, green: 0.94, blue: 0.99, alpha: 1.00)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var favChannelTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .custome(name: .manrope700, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var episodesNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.font = .custome(name: .manrope400, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - cell initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.channel = nil
    }
    
    //MARK: - Methods
    
    private func setupCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(favChannelImageView)
        contentView.addSubview(favChannelTitleLabel)
        contentView.addSubview(episodesNumberLabel)
    }
    
    func setup(withChanel chanel: ChannelModel) {
        favChannelImageView.image = UIImage(named: chanel.imageName)
        favChannelTitleLabel.text = chanel.channelName
        episodesNumberLabel.text = "\(chanel.numberOfEpisodes) Eps"
    }
    
    private func setupConstraints() {
        
        favChannelImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(47)
            make.height.width.equalTo(48)
            make.centerY.equalToSuperview()
        }
        
        favChannelTitleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(47)
            make.leading.equalTo(favChannelImageView.snp.trailing).inset(-15)
            make.top.equalToSuperview().inset(8)
        }
        
        episodesNumberLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(favChannelTitleLabel)
            make.top.equalTo(favChannelTitleLabel.snp.bottom).inset(-4)
            make.bottom.equalToSuperview().inset(8)
        }
    }
}
