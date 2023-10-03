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
    
    // MARK: - Duration Properties
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
    
    private lazy var durationSlider: CustomSlider = {
        var durSlider = CustomSlider(trackHeight: 2)
        return durSlider
    }()
    
//    // MARK: - Control Properties
//    private lazy var controlButtonsStackView: UIStackView = {
//        var stackView = UIStackView(arrangedSubviews: [
//            shuffleButton,
//            backButton,
//            playButton,
//            nextButton,
//            repeatButton
//        ])
//
//        stackView.backgroundColor = .red
//        stackView.axis = .horizontal
//        stackView.spacing = 20
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//
//        return stackView
//    }()
    private lazy var controlView: UIView = {
        var controlView = UIView()
//        controlView.backgroundColor = .lightGray
        return controlView
    }()
    
    private lazy var playButton: UIButton = {
        var playButton = UIButton(type: .system)
        setupControll(
            button: playButton,
            with: "Play",
            systemImage: false
        )
        playButton.tintColor = #colorLiteral(red: 0.1589552164, green: 0.5085405111, blue: 0.9443863034, alpha: 1)

        return playButton
    }()
    
    private lazy var nextButton: UIButton = {
        var nextButton = UIButton(type: .system)
        setupControll(
            button: nextButton,
            with: "Next",
            systemImage: false
        )
        return nextButton
    }()
    
    private lazy var backButton: UIButton = {
        var backButton = UIButton(type: .system)
        setupControll(
            button: backButton,
            with: "Back",
            systemImage: false
        )
        return backButton
    }()
    
    private lazy var shuffleButton: UIButton = {
        var shuffleButton = UIButton(type: .system)
        setupControll(
            button: shuffleButton,
            with: "Shuffle",
            systemImage: false
        )
        shuffleButton.tintColor = UIColor(red: 0.23, green: 0.25, blue: 0.27, alpha: 1.00)
        return shuffleButton
    }()
    
    private lazy var repeatButton: UIButton = {
        var repeatButton = UIButton(type: .system)
        setupControll(
            button: repeatButton,
            with: "Repeat1",
            systemImage: false
        )
        repeatButton.tintColor = UIColor(red: 0.23, green: 0.25, blue: 0.27, alpha: 1.00)
        return repeatButton
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
        self.addSubview(controlView)
        controlView.addSubview(playButton)
        controlView.addSubview(nextButton)
        controlView.addSubview(backButton)
        controlView.addSubview(shuffleButton)
        controlView.addSubview(repeatButton)
//        self.addSubview(controlButtonsStackView)
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
        
        controlView.snp.makeConstraints { make in
            make.top.equalTo(durationStackView.snp.bottom).offset(70)
            make.left.equalTo(durationStackView.snp.left).offset(15)
            make.right.equalTo(durationStackView.snp.right).offset(-15)
            make.height.equalTo(64)
        }
        
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(64)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton.snp.centerY)
            make.left.equalTo(playButton.snp.right).offset(32)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton.snp.centerY)
            make.right.equalTo(playButton.snp.left).offset(-32)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        shuffleButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton.snp.centerY)
            make.right.equalTo(backButton.snp.left).offset(-32)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        repeatButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton.snp.centerY)
            make.left.equalTo(nextButton.snp.right).offset(32)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        
        
        //
//        controlButtonsStackView.snp.makeConstraints { make in
//            make.top.equalTo(durationStackView.snp.bottom).offset(70)
//            make.left.equalTo(durationStackView.snp.left).offset(15)
//            make.right.equalTo(durationStackView.snp.right).offset(-15)
//            make.height.equalTo(100)
//        }
    }
    
    private func setupControll(button: UIButton, with imageName: String, systemImage: Bool) {
        if systemImage {
            let image = UIImage(systemName: imageName)
            button.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: imageName)
            button.setImage(image, for: .normal)
        }
    
       
    }
}
