//
//  AddressCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 25.02.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class AddressCell: UITableViewCell {
    
    let addressView = AddressView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(addressView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
