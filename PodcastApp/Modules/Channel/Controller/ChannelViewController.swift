//
//  ChannelViewController.swift
//  PodcastApp
//
//  Created by Admin on 26.09.2023.
//

import UIKit
import SnapKit

class ChannelViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Channel"
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    private let imageChanel: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(red: 0.68, green: 0.89, blue: 0.95, alpha: 1)
        image.layer.cornerRadius = 84/4
        return image
    }()
    
    private let nameChannelLabel: UILabel = {
        let label = UILabel()
        label.text = "Baby Pesut Podcast"
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    private let numberEpizodesLabel: UILabel = {
        let label = UILabel()
        label.text = "56 Eps | Dr. Oi om jean"
        label.font = UIFont(name: "manrope-light", size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "All Episode"
        label.font = UIFont(name: "manrope-medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    var channel = Source.makeChanel()
    
    let tableView: UITableView = .init()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Channel"
//        navigationController?.navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font: UIFont(name: "manrope-light", size: 16)
//        ]
        self.view.backgroundColor = .white
        setupViews()
        makeConstraints()
        
        tableView.register(ChannelViewCell.self, forCellReuseIdentifier: "ChannelViewCell")
//        tableView.rowHeight = 72
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupViews(){
        view.addSubview(titleLabel)
        view.addSubview(imageChanel)
        view.addSubview(nameChannelLabel)
        view.addSubview(numberEpizodesLabel)
        view.addSubview(startLabel)
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
    }
    
    private func makeConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        imageChanel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(113)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(84)
        }
        
        nameChannelLabel.snp.makeConstraints { make in
            make.top.equalTo(imageChanel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        numberEpizodesLabel.snp.makeConstraints { make in
            make.top.equalTo(nameChannelLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(numberEpizodesLabel.snp.bottom).offset(34)
            make.left.equalToSuperview().offset(32)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(startLabel.snp.bottom).offset(13)
            make.left.right.bottom.equalToSuperview()
        }
    
    }
    
    
}

extension ChannelViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        channel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChannelViewCell()
        cell.configure(channel: channel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
}

extension ChannelViewController: UITableViewDelegate{

}

