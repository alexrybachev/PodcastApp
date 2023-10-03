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
//        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let myCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCV.isPagingEnabled = true
        myCV.showsHorizontalScrollIndicator = false
        myCV.register(
            PodcastImageCell.self,
            forCellWithReuseIdentifier: PodcastImageCell.reuseId
        )
        
        return myCV
    }()
    
    private lazy var songNameLabel: UILabel = {
        var songName = createLabel(
            with: "Baby Pesut Ups 56",
            color: #colorLiteral(red: 0.2606227994, green: 0.2478592694, blue: 0.3162897527, alpha: 1),
            font: UIFont.custome(name: .manrope700, size: 16)
            ?? UIFont.systemFont(ofSize: 16)
        )
        return songName
    }()
    
    private lazy var songAuthorLabel: UILabel = {
        var songAuthor = createLabel(
            with: "Dr Oi om hean",
            color: #colorLiteral(red: 0.6377889514, green: 0.6319634914, blue: 0.6845200658, alpha: 1),
            font: UIFont.custome(name: .manrope400, size: 14)
            ?? UIFont.systemFont(ofSize: 14)
        )
        return songAuthor
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
        var startLabel = createLabel(
            with: "44:30",
            color: #colorLiteral(red: 0.2568137348, green: 0.2479013503, blue: 0.3163219392, alpha: 1),
            font: UIFont.custome(name: .manrope400, size: 14)
            ?? UIFont.systemFont(ofSize: 14)
        )
        return startLabel
    }()
    
    private lazy var endDurationLabel: UILabel = {
        var endLabel = createLabel(
            with: "56:38",
            color: #colorLiteral(red: 0.4809146523, green: 0.4751104116, blue: 0.5276280642, alpha: 1),
            font: UIFont.custome(name: .manrope400, size: 14)
            ?? UIFont.systemFont(ofSize: 14)
        )
        return endLabel
    }()
    
    private lazy var durationSlider: CustomSlider = {
        var durSlider = CustomSlider(trackHeight: 1)
        return durSlider
    }()
    
    // MARK: - Control Properties
    private lazy var controlView: UIView = {
        var controlView = UIView()
        return controlView
    }()
    
    private lazy var playButton: UIButton = {
        var playButton = UIButton(type: .system)
        setupControll(
            button: playButton,
            with: "Play",
            color: UIColor.customBlue
        )
        playButton.addTarget(
            self,
            action: #selector(playButtonDidTapped),
            for: .touchUpInside)
        return playButton
    }()
    
    private lazy var nextButton: UIButton = {
        var nextButton = UIButton(type: .system)
        setupControll(
            button: nextButton,
            with: "Next",
            color: UIColor.customBlue
        )
        return nextButton
    }()
    
    private lazy var backButton: UIButton = {
        var backButton = UIButton(type: .system)
        setupControll(
            button: backButton,
            with: "Back",
            color: UIColor.customBlue
        )
        return backButton
    }()
    
    private lazy var shuffleButton: UIButton = {
        var shuffleButton = UIButton(type: .system)
        setupControll(
            button: shuffleButton,
            with: "Shuffle",
            color: UIColor(red: 0.23, green: 0.25, blue: 0.27, alpha: 1.00)
        )
        return shuffleButton
    }()
    
    private lazy var repeatButton: UIButton = {
        var repeatButton = UIButton(type: .system)
        setupControll(
            button: repeatButton,
            with: "Repeat1",
            color: UIColor(red: 0.23, green: 0.25, blue: 0.27, alpha: 1.00)
        )
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
    }
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(songNameLabel.snp.top).offset(-30)
        }
        
        songNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(songAuthorLabel.snp.top).offset(-5)
        }
        
        songAuthorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(durationStackView.snp.top).offset(-30)
        }
        
        durationStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(45)
            make.right.equalToSuperview().offset(-45)
            make.height.equalTo(40)
            make.bottom.equalTo(controlView.snp.top).offset(-70)
        }
        
        controlView.snp.makeConstraints { make in
            make.left.equalTo(durationStackView.snp.left).offset(15)
            make.right.equalTo(durationStackView.snp.right).offset(-15)
            make.height.equalTo(64)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(64)
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
    }
    
    // MARK: Create UI Methods
    private func setupControll(button: UIButton, with imageName: String, color: UIColor) {
        let image = UIImage(named: imageName)
        button.setImage(image, for: .normal)
        button.tintColor = color
    }
    
    private func createLabel(with text: String, color: UIColor, font: UIFont) -> UILabel {
        let customLabel = UILabel()
        customLabel.text = text
        customLabel.textColor = color
        customLabel.font = font
        return customLabel
    }
}
