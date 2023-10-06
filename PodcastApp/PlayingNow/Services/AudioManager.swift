//
//  AudioManager.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 04.10.2023.
//

import Foundation
import AVFoundation

final class AudioManager {
    static let shared = AudioManager()
    
    var podcasts: [TestModel] = []
    var currentSongIndex = 0
    
    
    var isPlaying = false
    var isPause = false
    
    // MARK: - Private Properties
    private var player: AVPlayer?
    
    // MARK: - Public Properties
    var currentTime: CMTime {
        guard let currentTime = player?.currentTime() else { return CMTime() }
        return currentTime
    }
    
    var currentItemDuration: CMTime  {
        let currentItem = player?.currentItem?.duration ?? CMTime.zero
        return currentItem
    }
    
    //    var currentAudioDuration: CMTime? {
    //        return player?.currentItem?.duration
    //    }
    
    // MARK: - Private Init
    private init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Ошибка настройки аудиосесии \(error)")
        }
    }
    
    // MARK: - Public Methods
    func playAudio() {
        isPlaying = true
        
        let currentURL = podcasts[currentSongIndex].url
        if let audioURL = URL(string: currentURL) {
            let playerItem = AVPlayerItem(url: audioURL)
            player = AVPlayer(playerItem: playerItem)
        }
        
        player?.play()
    }
    
    func setNextSong() {
        if podcasts.isEmpty {
            return
        }
        
        let wasPlaying = isPlaying // Сохраняем текущее состояние
        
        if currentSongIndex < podcasts.count - 1 {
            currentSongIndex += 1
        }
        
        player = nil
        isPlaying = false
        isPause = false
        
        if wasPlaying {
            playAudio() // Если предыдущая песня играла, начнем воспроизведение новой
        }
    }
    
    func setPreviousSong() {
        if podcasts.isEmpty {
            return
        }
        
        let wasPlaying = isPlaying // Сохраняем текущее состояние
        
        if currentSongIndex > 0 {
            currentSongIndex -= 1
        }
        
        player = nil
        isPlaying = false
        isPause = false
        
        if wasPlaying {
            playAudio() // Если предыдущая песня играла, начнем воспроизведение новой
        }
    }
    
    func playNextSong() {
        setNextSong()
        if isPlaying {
            playAudio()
        }
    }
    
    func playPreviousSong() {
        setPreviousSong()
        if isPlaying {
            playAudio()
        }
    }
    
    
    func pauseAudio() {
        isPause = true
        isPlaying = false
        player?.pause()
        
    }
    
    func resumeAudio() {
        isPause = false
        isPlaying = true
        player?.play()
    }
    
    func setPodcasts(_ podcasts: [TestModel], index: Int) {
        self.podcasts = podcasts
        self.currentSongIndex = index
    }
    
    func stopAudio() {
        isPlaying = false
        isPause = false
        player?.pause()
        player?.seek(to: CMTime.zero) // Перемещаемся в начало трека
    }
}

