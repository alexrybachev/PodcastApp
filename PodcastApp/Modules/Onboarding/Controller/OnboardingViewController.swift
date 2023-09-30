//
//  OnboardingViewController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 24.09.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 250, height: 250)
        layout.scrollDirection = .horizontal
        
        let myCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCV.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
        myCV.isPagingEnabled = true
        myCV.showsHorizontalScrollIndicator = false
        myCV.isScrollEnabled = false
        
        return myCV
    }()
    
    private lazy var infoView: UIView = {
        var secondView = UIView()
        secondView.backgroundColor = #colorLiteral(red: 0.6869879365, green: 0.8190694451, blue: 0.9799563289, alpha: 1)
        secondView.layer.cornerRadius = 30
        return secondView
    }()
    
    private lazy var pageControl: UIPageControl = {
        var pageControll = UIPageControl()
        pageControll.numberOfPages = 3
        pageControll.currentPageIndicatorTintColor = .black
        pageControll.isEnabled = false
        return pageControll
    }()
    
    private lazy var nextButton: UIButton = {
        var nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.9257928729, green: 0.9576769471, blue: 0.9981418252, alpha: 1)
        nextButton.layer.cornerRadius = 20
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nextButton.addTarget(
            self,
            action: #selector(nextButtonDidTapped),
            for: .touchUpInside
        )
        return nextButton
    }()
    
    private lazy var skipButton: UIButton = {
        var skipButton = UIButton(type: .system)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        skipButton.setTitleColor(.black, for: .normal)
        skipButton.addTarget(
            self,
            action: #selector(startButtonDidTapped),
            for: .touchUpInside
        )
        return skipButton
    }()
    
    private lazy var startButton: UIButton = {
        var startButton = UIButton(type: .system)
        startButton.setTitle("Get Started", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0.1589552164, green: 0.5085405111, blue: 0.9443863034, alpha: 1)
        startButton.layer.cornerRadius = 16
        startButton.addTarget(
            self,
            action: #selector(startButtonDidTapped),
            for: .touchUpInside
        )
        return startButton
    }()
    
    private lazy var infoTitle: UITextView = {
        var infoTitle = UITextView()
        infoTitle.backgroundColor = .clear
        infoTitle.font = UIFont.boldSystemFont(ofSize: 25)
        return infoTitle
    }()
    
    private lazy var infoSubtitle: UITextView = {
        var infoSubtitle = UITextView()
        infoSubtitle.backgroundColor = .clear
        infoSubtitle.font = UIFont.boldSystemFont(ofSize: 20)
        return infoSubtitle
    }()
    
    // MARK: - Private Properties
    private var currentSliderIndex = 0
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupConstraints()
        startButton.isHidden = true
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        showCaption(atIndex: currentSliderIndex)
        setupPageControl()
    }
    
    // MARK: - Private Actions
    @objc private func nextButtonDidTapped() {
        if currentSliderIndex < Slide.collection.count - 1 {
            currentSliderIndex += 1
            
            showCaption(atIndex: currentSliderIndex)
            
            let indexPath = IndexPath(item: currentSliderIndex, section: 0)
            myCollectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: true
            )
            
            pageControl.currentPage = currentSliderIndex
            
            if currentSliderIndex == 2 {
                skipButton.isHidden = true
                nextButton.isHidden = true
                startButton.isHidden = false
            }
        }
    }
    
    @objc private func startButtonDidTapped() {
        AppSettingsManager.setCompleted()
        let tabBarVC = CustomTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    // MARK: - Private methods
    private func showCaption(atIndex index: Int) {
        let slide = Slide.collection[index]
        infoTitle.text = slide.title
        infoSubtitle.text = slide.secontTitle
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = Slide.collection.count
    }
    
    private func addViews() {
        view.addSubview(myCollectionView)
        view.addSubview(infoView)
        infoView.addSubview(pageControl)
        infoView.addSubview(nextButton)
        infoView.addSubview(skipButton)
        infoView.addSubview(startButton)
        infoView.addSubview(infoTitle)
        infoView.addSubview(infoSubtitle)
    }
    
    private func setupConstraints() {
        myCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.bottom.equalTo(infoView.snp.top).offset(-20)
        }
        
        infoView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(330)
        }
        
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-20)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(85)
            make.height.equalTo(58)
        }
        
        skipButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-20)
            make.centerY.equalTo(nextButton.snp.centerY)
            make.left.equalToSuperview().offset(30)
        }
        
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(58)
        }
        
        infoTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(100)
        }
        
        infoSubtitle.snp.makeConstraints { make in
            make.top.equalTo(infoTitle.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(70)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Slide.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = myCollectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath) as? ImageCell
        else {
            return UICollectionViewCell()
        }
        
        let imageName = Slide.collection[indexPath.item].imageName
        
        cell.configure(with: imageName)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        pageControl.currentPage = index
    }
}

