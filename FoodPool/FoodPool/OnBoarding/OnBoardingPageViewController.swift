//
//  OnBoardingViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 28.02.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit

final class OnBoardingPageViewController: UIViewController {
    
    lazy var layout: UICollectionViewFlowLayout = .create(
        itemSize: .init(width: 200, height: 200),
        scrollDirection: .horizontal
    )
    
    lazy var collection: UICollectionView = .createCollection(
        layout: layout,
        addCells: [OnBoardingPageCell.self],
        backgroundColor: .white,
        showHorizontalIndicator: false,
        showVerticalIndicator: false,
        isPaging: true
    )
    
    lazy var pageControl: UIPageControl = .create(
        currentPage: 0,
        numberOfPages: 0,
        indicatorColor: .secondaryColor,
        currentIndicatorColor: .mainColor,
        backgroundColor: .clear,
        hidesForSinglePage: true
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        view.addSubview(collection)
        collection.fillSuperView()
        view.addSubview(pageControl)
        pageControl.anchor(leading: view.leadingAnchor,
                           bottom: view.safeAreaLayoutGuide.bottomAnchor,
                           trailing: view.trailingAnchor)
        pageControl.sizeAnchor(width: 200.0,
                               height: 50.0)
    }
}

extension OnBoardingPageViewController: UICollectionViewDelegate {}

extension OnBoardingPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingPageCell.reuseIdentifier, for: indexPath) as? OnBoardingPageCell else {
            print("ERROR CELL")
            return UICollectionViewCell()
        }
        print("CELL")
        return cell
    }
    
    
}
