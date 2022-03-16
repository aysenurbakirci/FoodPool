//
//  OnBoardingPageView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit

final class OnBoardingPageView: UIView {
    
    //MARK: - Properties
    public var source: (UICollectionViewDataSource & UICollectionViewDelegate)? = nil {
        didSet {
            collection.delegate = source
            collection.dataSource = source
        }
    }
    
    public var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    public var numberOfPages: Int = 1 {
        didSet {
            pageControl.numberOfPages = numberOfPages
        }
    }
    
    //MARK: - UI Properties
    private lazy var layout: UICollectionViewFlowLayout = .create(
        itemSize: frame.size,
        scrollDirection: .horizontal
    )
    
    private lazy var collection: UICollectionView = .createCollection(
        layout: layout,
        backgroundColor: .white,
        showHorizontalIndicator: false,
        showVerticalIndicator: false,
        isPaging: true
    )
    
    private lazy var pageControl: UIPageControl = .create(
        currentPage: currentPage,
        numberOfPages: numberOfPages,
        indicatorColor: .secondaryColor,
        currentIndicatorColor: .mainColor,
        backgroundColor: .clear,
        hidesForSinglePage: true
    )
    
    //MARK: - Initalization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Configuration
    private func configuration() {
        addSubview(collection)
        collection.fillSuperView()
        addSubview(pageControl)
        pageControl.anchor(leading: leadingAnchor,
                           bottom: safeAreaLayoutGuide.bottomAnchor,
                           trailing: trailingAnchor)
        pageControl.sizeAnchor(width: frame.size.width,
                               height: 50.0)
    }
    
    private func registerCells() {
        collection.register(OnBoardingPageCell.self,
                            forCellWithReuseIdentifier: OnBoardingPageCell.reuseIdentifier)
    }
    
    //MARK: - Helper Methods
    public func invalidateLayout() {
        layout.invalidateLayout()
    }
    
    public func scrollToItem(indexPath: IndexPath,
                             scrollPosition: UICollectionView.ScrollPosition) {
        collection.scrollToItem(at: indexPath,
                                at: scrollPosition,
                                animated: true)
    }
}
