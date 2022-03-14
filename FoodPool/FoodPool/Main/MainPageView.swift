//
//  MainView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit

final class MainPageView: UIView {
    
    private lazy var tableView = UITableView()
    
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
    
    private func configuration() {
        addSubview(tableView)
        tableView.fillSuperView()
        tableView.backgroundColor = .background
    }
    
    private func registerCells() {
        tableView.separatorStyle = .none
        tableView.register(CuisineCell.self,
                           forCellReuseIdentifier: CuisineCell.reuseIdentifier)
        tableView.register(RestaurantCell.self,
                           forCellReuseIdentifier: RestaurantCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
