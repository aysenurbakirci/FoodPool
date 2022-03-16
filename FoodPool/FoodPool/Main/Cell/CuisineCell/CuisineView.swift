//
//  CuisineView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper
import FoodPoolAPI

final class CuisineView: UIView {
    
    //MARK: - Properties
    static let cellHeightRatio: CGFloat = 1.1
    static let cellWidthRatio: CGFloat = 0.3
    static let cellWidth = (UIScreen.main.bounds.size.width) * cellWidthRatio
    static let cellHeight = cellWidth * cellHeightRatio
    
    var cuisineList: [Cuisine] = []
    
    //MARK: - UI Properties
    private lazy var layout: UICollectionViewFlowLayout = .create(
        itemSize: CGSize(width: CuisineView.cellWidth, height: CuisineView.cellHeight),
        scrollDirection: .horizontal,
        interItemSpacing: 2.0,
        lineSpacing: 6.0
    )
    
    private lazy var collection: UICollectionView = .createCollection(
        layout: layout,
        backgroundColor: .white,
        showHorizontalIndicator: false,
        showVerticalIndicator: false,
        isPaging: true
    )
    
    //MARK: - Initalization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collection)
        collection.backgroundColor = .background
        collection.fillSuperView()
        collection.sizeAnchor(height: CuisineView.cellHeight)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CuisineViewCell.self,
                            forCellWithReuseIdentifier: CuisineViewCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CollectionView Methods
extension CuisineView: UICollectionViewDelegate {}

extension CuisineView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisineList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CuisineViewCell = collectionView.dequeue(for: indexPath)
        let model = cuisineList[indexPath.row]
        cell.apply(imageName: model.image, title: model.cuisine)
        cell.backgroundColor = .background
        return cell
    }
}
