//
//  CollectionViewDataSouce.swift
//  PodcastApp
//
//  Created by Elizaveta Eremyonok on 29.09.2023.
//

import Foundation
import UIKit

/// This class is a simple, immutable, declarative data source for UITableView
final class CollectionViewDataSource: NSObject, UICollectionViewDataSource  {

    
    
    private var models: [T]
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (V, T) -> V
    
    var count: Int {
        return self.models.count
    }
    
    var isEmpty: Bool {
        return self.models.isEmpty
    }
    
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    

//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell
//        let model = models[indexPath.row]
//        return configureCell(cell, model)
//    }

    
    /// MARK: updates for search
    func update(models: [T]) {
        self.models = models
    }
    
    func object(at indexPath: IndexPath) -> T {
        return self.models[indexPath.item]
    }
    
    func removeItem(at indexPath: IndexPath) {
        self.models.remove(at: indexPath.item)
    }
}
