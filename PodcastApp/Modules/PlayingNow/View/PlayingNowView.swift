//
//  PlayingNowView.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 02.10.2023.
//

import UIKit

final class PlayingNowView: UIView {
    
    // MARK: - Private UI Properties
    private var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let myCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCV.isPagingEnabled = true
        myCV.showsHorizontalScrollIndicator = false
        myCV.register(SongImageCell.self, forCellWithReuseIdentifier: "cell")
        
        return myCV
    }()
    
    private lazy var songNameLabel: UILabel = {
        var songName = UILabel()
        songName.text = "Baby Pesut Ups 56"
        songName.textColor = #colorLiteral(red: 0.2606227994, green: 0.2478592694, blue: 0.3162897527, alpha: 1)
        songName.font = UIFont.custome(name: .manrope700, size: 16)
        return songName
    }()
    
    private lazy var songAuthorLabel: UILabel = {
        var songLabel = UILabel()
        songLabel.text = "Dr Oi om hean"
        songLabel.textColor = #colorLiteral(red: 0.6377889514, green: 0.6319634914, blue: 0.6845200658, alpha: 1)
        songLabel.font = UIFont.custome(name: .manrope400, size: 14)
        return songLabel
    }()
    
    private lazy var durationStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [
            startDurationLabel,
            durationSlider,
            endDurationLabel
        ])
        stackView.spacing = 10
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private lazy var startDurationLabel: UILabel = {
        var startLabel = UILabel()
        startLabel.text = "44:30"
        startLabel.font = UIFont.systemFont(ofSize: 14)
        return startLabel
    }()
    
    private lazy var endDurationLabel: UILabel = {
        var endLabel = UILabel()
        endLabel.text = "56:38"
        endLabel.font = UIFont.systemFont(ofSize: 14)
        endLabel.textColor = #colorLiteral(red: 0.4809146523, green: 0.4751104116, blue: 0.5276280642, alpha: 1)
        return endLabel
    }()
    
    private lazy var durationSlider: UISlider = {
        var durSlider = UISlider()
        durSlider.minimumTrackTintColor = #colorLiteral(red: 0.1607843137, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        durSlider.maximumTrackTintColor = #colorLiteral(red: 0.1607843137, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        durSlider.thumbTintColor = #colorLiteral(red: 0.1607843137, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        
        let thumbImage = UIImage(named: "thumb")
        durSlider.setThumbImage(thumbImage, for: .normal)
        durSlider.setThumbImage(thumbImage, for: .highlighted)
        return durSlider
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func transferDelegates(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        mainCollectionView.dataSource = dataSource
        mainCollectionView.delegate = delegate
    }
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(mainCollectionView)
        self.addSubview(songNameLabel)
        self.addSubview(songAuthorLabel)
        self.addSubview(durationStackView)
    }
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(350)
        }
        
        songNameLabel.snp.makeConstraints { make in
            make.top.equalTo(mainCollectionView.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        
        songAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(songNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        durationStackView.snp.makeConstraints { make in
            make.top.equalTo(songAuthorLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(45)
            make.right.equalToSuperview().offset(-45)
        }
    }
}
