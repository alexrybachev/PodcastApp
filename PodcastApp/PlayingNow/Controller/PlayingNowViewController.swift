//
//  PlayingNowViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit
import AVFoundation

final class PlayingNowViewController: UIViewController {
    
    // MARK: - AV Properties
    private let player = AudioManager.shared
    var currentIndex = 2
    private var timer: Timer?
    private var timeLabelsTimer: Timer?
    
    var lastContentOffset: CGPoint = .zero
    let minimumScrollDistance: CGFloat = 10
    
    var testArraySongs = [
        TestModel(color: .blue, url: "https://www.kozco.com/tech/32.mp3"),
        TestModel(color: .green, url: "https://file-examples.com/storage/feaade38c1651bd01984236/2017/11/file_example_MP3_700KB.mp3"),
        TestModel(color: .orange, url: "https://www.kozco.com/tech/LRMonoPhase4.mp3"),
        TestModel(color: .red, url: "https://www.kozco.com/tech/piano2-CoolEdit.mp3"),
        TestModel(color: .yellow, url: "https://www.kozco.com/tech/organfinale.mp3")
    ]
    
    // MARK: - Private Properties
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
    
    private let colors = [UIColor.red, UIColor.green, UIColor.brown, UIColor.blue]
    
    // MARK: - Private UI Properties
    private let playingNowView = PlayingNowView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        addViews()
        setupConstraints()
        setupNavigationBar()
        
        player.setPodcasts(testArraySongs, index: currentIndex)
        
        playingNowView.transferDelegates(dataSource: self, delegate: self)
        
        // настройка кнопок next и back
        setupNavigationButton()
        
        // настройка кнопки play и pause
        player.currentSongIndex = currentIndex
        setupPlayPauseButton()
        
        // установка начальных значений для лейблов с длительностью подкаста
        updateCurrentTimeLabel()
        updateRemainingTimeLabel()
        
        // настройка обновления слайдера
//                changeActionTime()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        let indexPath = IndexPath(item: currentIndex, section: 0)
        
        // отображаем переданный индекс ячейки при запуске приложения
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
    private func setupPlayPauseButton() {
        playingNowView.playPauseAction = { [weak self] in
            guard let self = self else { return }
            
            if player.isPlaying {
                player.pauseAudio()
                stopUpdatingSlider()
                self.playingNowView.playPauseButton.setImage(UIImage(named: "Play"), for: .normal)
            } else if AudioManager.shared.isPause {
                player.resumeAudio()
                startUpdatingSlider()
                self.playingNowView.playPauseButton.setImage(UIImage(named: "Stop"), for: .normal)
            } else {
                player.playAudio()
                startUpdatingSlider()
                self.playingNowView.playPauseButton.setImage(UIImage(named: "Stop"), for: .normal)
            }
        }
    }
    
    // MARK: - Update Slider Methods
    @objc private func updateSlider() {
        let currentTime = CMTimeGetSeconds(player.currentTime )
        let duration = CMTimeGetSeconds(player.currentItemDuration)
        
        if duration.isFinite && duration > 0 {
            let percentage = Float(currentTime / duration)
            playingNowView.durationSlider.value = percentage
        } else {
            playingNowView.durationSlider.value = 0
        }
    }
    
    // начинаем обновление слайдре
    private func startUpdatingSlider() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
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
    
    // перемотка
    //    private func changeActionTime() {
    //        playingNowView.sliderAction = { [weak self] in
    //            let timeToSeek = Double(self?.playingNowView.durationSlider.value ?? 0.0) * (self?.player.player?.currentItem!.duration.seconds ?? 0.0)
    //
    //
    //            self?.player.player?.seek(to: CMTime(seconds: timeToSeek, preferredTimescale: 1))
    //        }
    //    }
    
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
        
        guard let currentIndexLastItem = currentIndexPath.last else { return }
        
        // сбрасываем значение времени в time labels
        //        updateCurrentTimeLabel()
        //        updateRemainingTimeLabel()
        //
        //        // сбрасываем слайдер
        //        updateSlider()
        
        // переход к следующей ячейке коллекции в зависимости индекса
        playingNowView.mainCollectionView.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Update labels with current time
    func formatTime(seconds: Double) -> String {
        
        if seconds.isInfinite || seconds.isNaN {
            return "00:00"
        }
        // Форматируйте время в строку в нужном формате (например, "00:00")
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func updateCurrentTimeLabel() {
        let currentTimeInSeconds = CMTimeGetSeconds(player.currentTime)
        let formattedTime = formatTime(seconds: currentTimeInSeconds)
        playingNowView.startDurationLabel.text = formattedTime
    }
    
    func updateRemainingTimeLabel() {
        let remainingTimeInSeconds = CMTimeGetSeconds(player.currentItemDuration) - CMTimeGetSeconds(player.currentTime)
        let formattedTime = formatTime(seconds: remainingTimeInSeconds)
        playingNowView.endDurationLabel.text = formattedTime
    }
    
    func startUpdatingLabels() {
        timeLabelsTimer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateLabels),
            userInfo: nil,
            repeats: true
        )
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    @objc func updateLabels() {
        updateCurrentTimeLabel()
        updateRemainingTimeLabel()
    }
    
    func stopUpdatingLabels() {
        timeLabelsTimer?.invalidate()
        timeLabelsTimer = nil
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
                
                player.currentSongIndex = currentIndex
                if player.isPlaying {
                    player.playAudio()
                }
                
                // сбрасываем значение времени в time labels
                //                updateCurrentTimeLabel()
                //                updateRemainingTimeLabel()
                //
                //                // сбрасываем слайдер
                //                updateSlider()
                
                // переход к следующей ячейке коллекции в зависимости индекса
                playingNowView.mainCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            }
        }
    }
}
