//
//  OnBoardingView.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 28.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

final class OnBoardingPageView: UIView {
    
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
    
    init(delegate: UICollectionViewDelegate,
         dataSource: UICollectionViewDataSource) {
        super.init(frame: .zero)
        
        collection.delegate = delegate
        collection.dataSource = dataSource
        
        addSubview(collection)
        collection.fillSuperView()
        addSubview(pageControl)
        pageControl.anchor(leading: self.leadingAnchor,
                           bottom: self.safeAreaLayoutGuide.bottomAnchor,
                           trailing: self.trailingAnchor)
        pageControl.sizeAnchor(width: 200.0,
                               height: 50.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
