//
//  ButtonCell.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class ButtonCell: UITableViewCell {
    
    lazy var button: Button = .init(
        type: .primary,
        title: "Add New Address",
        image: .plus
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any?, selector: Selector) {
        button.addTarget(target: target, selector: selector)
    }
}
