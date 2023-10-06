//
//  PlayingNowViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import AVFoundation

final class PlayingNowViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let playingNowView = PlayingNowView()
    
    // MARK: - AV Properties
    private let player = AudioManager.shared
    private var podcasts: [PodcastEpisode]?
    
    // MARK: - Private Timers
    private var timer: Timer?
    private var timeLabelsTimer: Timer?
    
    // MARK: - Layout Properties
    private var lastContentOffset: CGPoint = .zero
    private let minimumScrollDistance: CGFloat = 10
    
    private var pageSize: CGSize {
        guard
            let layout = playingNowView.mainCollectionView.collectionViewLayout
                as? CustomCarouselFlowLayout
        else {
            return CGSize.zero
        }
        
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        
        return pageSize
    }
    
    // MARK: - Test Properties
    private let colors = [UIColor.red, UIColor.green, UIColor.brown, UIColor.blue]
    private var testArraySongs = [
        TestModel(color: .blue, url: "https://www.kozco.com/tech/32.mp3"),
        TestModel(color: .green, url: "https://file-examples.com/storage/feaade38c1651bd01984236/2017/11/file_example_MP3_700KB.mp3"),
        TestModel(color: .orange, url: "https://www.kozco.com/tech/LRMonoPhase4.mp3"),
        TestModel(color: .red, url: "https://www.kozco.com/tech/piano2-CoolEdit.mp3"),
        TestModel(color: .yellow, url: "https://www.kozco.com/tech/organfinale.mp3")
    ]
    private var currentIndex = 2
    
    // MARK: - Init
    init(podcastEpisode: [PodcastEpisode]?, author: String?, index: Int) {
        self.podcasts = podcastEpisode
        self.playingNowView.authorNameLabel.text = author
        self.player.currentIndex = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        addViews()
        setupConstraints()
        setupNavigationBar()
        
        // передаем массив с подкастами и индекс в playerManager
        player.setPodcasts(testArraySongs, index: currentIndex)
        
        playingNowView.transferDelegates(dataSource: self, delegate: self)
        
        // настройка кнопок next и back
        setupNavigationButton()
        
        // настройка кнопки play и pause
        player.currentIndex = currentIndex
        setupPlayPauseButton()
        
        // устанавливаем длительность подкаста при загрузке экрана
        loadDurationForCurrentTrack()
        
        // настройка обновления слайдера
        changeActionTime()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        let indexPath = IndexPath(item: currentIndex, section: 0)
        
        // отображаем ячейку по индексу который пришел из предыдущего экрана
        DispatchQueue.main.async {
            self.playingNowView.mainCollectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: false
            )
        }
    }
    
    // MARK: - Private Actions
    @objc private func rightBarButtonDidTapped() {
    }
    
    // MARK: - Privaet Methods
    
    // MARK: - Setup PlayPause
    private func setupPlayPauseButton() {
        playingNowView.playPauseAction = { [weak self] in
            guard let self = self else { return }
            
            if player.isPlaying {
                player.pauseAudio()
                stopUpdatingSlider()
                stopUpdatingLabels()
                self.playingNowView.playPauseButton.setImage(UIImage(named: "Play"), for: .normal)
            } else if AudioManager.shared.isPause {
                player.resumeAudio()
                startUpdatingSlider()
                self.playingNowView.playPauseButton.setImage(UIImage(named: "Stop"), for: .normal)
            } else {
                player.playAudio()
                startUpdatingSlider()
                startUpdatingLabels()
                NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(playerDidFinishPlaying),
                    name: .AVPlayerItemDidPlayToEndTime,
                    object: nil
                )
                self.playingNowView.playPauseButton.setImage(UIImage(named: "Stop"), for: .normal)
            }
        }
    }
    
    // MARK: - Slider Methods
    @objc private func updateSlider() {
        let currentTime = CMTimeGetSeconds(player.currentTime )
        let duration = CMTimeGetSeconds(player.currentItemDuration)
        
        if duration.isFinite && duration > 0 {
            let percentage = Float(currentTime / duration)
            playingNowView.durationSlider.value = percentage
            updateCurrentTimeLabel()
            updateRemainingTimeLabel()
        } else {
            playingNowView.durationSlider.value = 0
        }
    }
    
    // начинаем обновление слайдре
    private func startUpdatingSlider() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(updateSlider),
            userInfo: nil,
            repeats: true
        )
    }
    
    // останавливаем обновление слайдера
    private func stopUpdatingSlider() {
        timer?.invalidate()
        timer = nil
    }
    
    // переход на новую песню после окончания текущей
    @objc func playerDidFinishPlaying(note: NSNotification) {
        // останавливаем обновление слайдера
        stopUpdatingSlider()
        
        //переключаемся на новую песню
        player.playNextSong()
        
        let currentIndexPath = IndexPath(row: player.currentIndex, section: 0)
        playingNowView.mainCollectionView.scrollToItem(
            at: currentIndexPath,
            at: .centeredHorizontally,
            animated: true
        )
        
        // обновляем слайдер после переключения на новую песню
        startUpdatingSlider()
    }
    
    // перемотка
    private func changeActionTime() {
        playingNowView.sliderAction = { [weak self] in
            guard let weakSelf = self else { return }
            
            let timeToSeek = Double(weakSelf.playingNowView.durationSlider.value) * weakSelf.player.currentItemDuration.seconds
            weakSelf.player.seek(to: CMTime(seconds: timeToSeek, preferredTimescale: 1000))
        }
    }
    
    // MARK: - Next or Back Button Methods
    private func setupNavigationButton() {
        playingNowView.nextOrBackAction = { [weak self] sender in
            self?.scrollToNextOrPreviousCell(sender)
        }
    }
    
    // метод для перехода к следующему или предыдущему item
    private func scrollToNextOrPreviousCell(_ sender: UIButton) {
        let contentOffset = playingNowView.mainCollectionView.contentOffset
        let cellSize = playingNowView.layout.itemSize
        let numberOfItems = playingNowView.mainCollectionView.numberOfItems(inSection: 0)
        let currentItemIndex = Int(round(contentOffset.x / cellSize.width))
        var currentIndexPath = IndexPath()
        
        if sender == playingNowView.nextButton {
            player.playNextSong()
            
            if currentItemIndex < numberOfItems - 1 {
                currentIndexPath = IndexPath(item: currentItemIndex + 1, section: 0)
            } else {
                // Если уже на последней ячейке, не изменяем индекс
                currentIndexPath = IndexPath(item: currentItemIndex, section: 0)
            }
        } else {
            player.playPreviousSong()
            
            if currentItemIndex > 0 {
                currentIndexPath = IndexPath(item: currentItemIndex - 1, section: 0)
            } else {
                // Если уже на первой ячейке, не изменяем индекс
                currentIndexPath = IndexPath(item: currentItemIndex, section: 0)
            }
        }
        
        loadDurationForCurrentTrack()
        updateCurrentTimeLabel()
        updateRemainingTimeLabel()
        
        // переход к следующей ячейке коллекции в зависимости индекса
        playingNowView.mainCollectionView.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Update labels with current time
    func formatTime(seconds: Double) -> String {
        if seconds.isInfinite || seconds.isNaN {
            return "00:00"
        }
        
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startUpdatingLabels() {
        timeLabelsTimer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateLabels),
            userInfo: nil,
            repeats: true
        )
        RunLoop.main.add(timeLabelsTimer!, forMode: .common)
    }
    
    func updateCurrentTimeLabel() {
        // Получите текущее время из AudioManager
        let currentTimeInSeconds = CMTimeGetSeconds(player.currentTime)
        let formattedTime = formatTime(seconds: currentTimeInSeconds)
        playingNowView.startDurationLabel.text = formattedTime
    }
    
    func updateRemainingTimeLabel() {
        // Получите текущую длительность песни и текущее время из AudioManager
        let currentTimeInSeconds = CMTimeGetSeconds(player.currentTime)
        let totalDurationInSeconds = CMTimeGetSeconds(player.currentItemDuration)
        
        let remainingTimeInSeconds = totalDurationInSeconds - currentTimeInSeconds
        let formattedTime = formatTime(seconds: remainingTimeInSeconds)
        
        playingNowView.endDurationLabel.text = formattedTime
    }
    
    @objc func updateLabels() {
        updateCurrentTimeLabel()
        updateRemainingTimeLabel()
    }
    
    func stopUpdatingLabels() {
        timeLabelsTimer?.invalidate()
        timeLabelsTimer = nil
    }
    
    // загрузка длительности трека label
    func loadDurationForCurrentTrack() {
        guard let url = URL(string: player.podcasts[player.currentIndex].url) else { return }
        AudioManager.shared.getDuration(for: url) { [weak self] (time) in
            DispatchQueue.main.async {
                if let duration = time {
                    let durationInSeconds = CMTimeGetSeconds(duration)
                    let formattedDuration = self?.formatTime(seconds: durationInSeconds)
                    self?.playingNowView.endDurationLabel.text = formattedDuration
                }
            }
        }
    }
}

// MARK: - Setup UI
extension PlayingNowViewController {
    private func addViews() {
        view.addSubview(playingNowView)
    }
    
    private func setupConstraints() {
        playingNowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        title = "Now playing"
        
        let rightBarButton = UIBarButtonItem(
            image: UIImage(named: "PlaylistIcon"),
            style: .done,
            target: self,
            action: #selector(rightBarButtonDidTapped)
        )
        
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

// MARK: - UICollectionViewDataSource
extension PlayingNowViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        testArraySongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PodcastImageCell.reuseId,
                for: indexPath) as? PodcastImageCell
        else {
            return  UICollectionViewCell()
        }
        
        let song = testArraySongs[indexPath.row].color
        cell.configureView(with: song)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PlayingNowViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playingNowView.mainCollectionView.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )
    }
}

// MARK: - UIScrollViewDelegate
extension PlayingNowViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == playingNowView.mainCollectionView {
            let visibleRect = CGRect(origin: scrollView.contentOffset, size: scrollView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            
            if let indexPath = playingNowView.mainCollectionView.indexPathForItem(at: visiblePoint) {
                let currentIndex = indexPath.item
                
                player.currentIndex = currentIndex
                if player.isPlaying {
                    loadDurationForCurrentTrack()
                    player.playAudio()
                }
                
                // обновляем слайдер
                updateSlider()
                
                // загружаем длительность трека в label
                loadDurationForCurrentTrack()
                
                updateCurrentTimeLabel()
                updateRemainingTimeLabel()
                
                // переход к следующей ячейке коллекции в зависимости индекса
                playingNowView.mainCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            }
        }
    }
}
