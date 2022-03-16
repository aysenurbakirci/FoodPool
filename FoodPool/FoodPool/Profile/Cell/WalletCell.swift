//
//  WalletCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 25.02.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import AutoLayoutHelper

final class WalletCell: UITableViewCell {
    
    //MARK: - Properties
    let walletView = WalletView()
    
    //MARK: - Initalization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(walletView)
        walletView.fillSuperView(with: 10.0)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Apply Cell
    func apply(amount: Double) {
        walletView.apply(amount: amount)
    }
    
    //MARK: - Add Target To Cell
    func addButtonTarget(addButtonTarget: Any?, addButtonSelector: Selector) {
        walletView.addTarget(target: addButtonTarget, selector: addButtonSelector)
    }
    
}
