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
    
    //MARK: - UI Properties
    lazy var button: Button = .init(
        type: .primary,
        title: "Add New Address",
        image: .plus
    )
    
    //MARK: - Initalization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.fillSuperView()
        
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        directionalLayoutMargins = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add Target To Cell
    func addButtonTarget(target: Any?, selector: Selector) {
        button.addTarget(target: target, selector: selector)
    }
}
