//
//  OnBoardingCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 28.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper
import FoodPoolKit

final class OnBoardingPageCell: UICollectionViewCell {
    
    //MARK: - Properties
    private lazy var view = OnBoardingView(frame: self.frame)
    
    //MARK: - Initalization
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        view.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Apply Model
    func apply(image: UIImage?,
               title: String,
               description: String?) {
        view.apply(image: image,
                   title: title,
                   subtitle: description)
    }
}
