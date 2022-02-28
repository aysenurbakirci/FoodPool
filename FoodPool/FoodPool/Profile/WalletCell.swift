//
//  WalletCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 25.02.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class WalletCell: UITableViewCell {
    
    let walletView = WalletView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(walletView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
