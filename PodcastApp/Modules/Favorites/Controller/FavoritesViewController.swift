import UIKit
import SnapKit

class FavoritesViewController: UIViewController {
    
    // MARK: - User Interface
    private lazy var favouriteChanelsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    // MARK: - private properties
    private var favouriteChanels = ChannelModel.makeMockData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
        self.setupTableView()
    }
    
    // MARK: - Private methodes
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(favouriteChanelsTableView)
        
    }
    
    private func setupTableView() {
        favouriteChanelsTableView.dataSource = self
        favouriteChanelsTableView.delegate = self
        favouriteChanelsTableView.register(
            FavouriteChannelCell.self,
            forCellReuseIdentifier: FavouriteChannelCell.reuseID)
        
        favouriteChanelsTableView.estimatedRowHeight = 60
    }
    
    private func setupConstraints() {
        
        favouriteChanelsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}


// MARK: - table protocols
extension FavoritesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteChanels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavouriteChannelCell.reuseID,
            for: indexPath) as? FavouriteChannelCell else { return  .init()}
        
        let favChanel = self.favouriteChanels[indexPath.row]
        cell.setup(withChanel: favChanel)
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
