//
//  AddressCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 25.02.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import AutoLayoutHelper

final class AddressCell: UITableViewCell {
    
    let addressView = AddressView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(addressView)
        addressView.fillSuperView(with: 10.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(title: String, address: String) {
        addressView.apply(addressTitle: title, address: address)
    }
    
    func addButtonTarget(editButtonTarget: Any?, editButtonSelector: Selector) {
        addressView.addTarget(target: editButtonTarget, selector: editButtonSelector)
    }
}
