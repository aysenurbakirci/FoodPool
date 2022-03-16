//
//  FooterView.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper
import FoodPoolKit

final class FooterView: UITableViewHeaderFooterView {
    
    //MARK: - Properties
    static let reuseIdentifier = "FooterView"
    lazy var totalView = TotalView()

    //MARK: - Initalization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(totalView)
        totalView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Apply View
    func apply(amount: Double) {
        totalView.apply(amount: amount)
    }
    
    //MARK: - Add Target To View
    func addTarget(_ target: Any?, selector: Selector) {
        totalView.addTarget(target, selector: selector)
    }
}
