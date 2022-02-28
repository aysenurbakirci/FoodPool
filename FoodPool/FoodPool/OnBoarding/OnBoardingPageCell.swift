//
//  OnBoardingCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 28.02.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import FoodPoolKit

final class OnBoardingPageCell: UICollectionViewCell {
    
    lazy var cellView = OnBoardingView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(image: UIImage? = nil,
               title: String,
               description: String? = nil) {
        cellView.apply(image: image,
                       title: title,
                       subtitle: description)
    }
}
