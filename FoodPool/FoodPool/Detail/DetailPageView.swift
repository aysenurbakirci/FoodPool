//
//  DetailPageView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit

final class DetailPageView: UIView {
    
    lazy var tableView = UITableView()
    
    var source: (UITableViewDataSource & UITableViewDelegate)? = nil {
        didSet {
            tableView.delegate = source
            tableView.dataSource = source
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        registerCells()
    }
    
    func configuration() {
        addSubview(tableView)
        tableView.fillSuperView()
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
    }
    
    func registerCells() {
        tableView.register(RestaurantCell.self,
                           forCellReuseIdentifier: RestaurantCell.reuseIdentifier)
        tableView.register(MealCell.self,
                           forCellReuseIdentifier: MealCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
