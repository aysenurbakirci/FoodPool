//
//  BasketPageView.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit
import FoodPoolKit

final class BasketPageView: UIView {
    
    //MARK: - Properties
    private lazy var tableView = UITableView()
    
    var source: (UITableViewDataSource & UITableViewDelegate)? = nil {
        didSet {
            tableView.delegate = source
            tableView.dataSource = source
        }
    }
    
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
        addSubviews(tableView)
        tableView.fillSuperView()
        tableView.backgroundColor = .background
    }
    
    private func registerCells() {
        tableView.register(BasketCell.self,
                           forCellReuseIdentifier: BasketCell.reuseIdentifier)
        tableView.register(HeaderView.self,
                           forHeaderFooterViewReuseIdentifier: HeaderView.reuseIdentifier)
        tableView.register(FooterView.self,
                           forHeaderFooterViewReuseIdentifier: FooterView.reuseIdentifier)
    }
}
