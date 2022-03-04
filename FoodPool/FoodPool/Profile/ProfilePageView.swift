//
//  ProfilePageVİew.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit

final class ProfilePageView: UIView {
    
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
    }
    
    func registerCells() {
        tableView.register(AddressCell.self,
                           forCellReuseIdentifier: AddressCell.reuseIdentifier)
        tableView.register(WalletCell.self,
                           forCellReuseIdentifier: WalletCell.reuseIdentifier)
        tableView.register(ProfileCell.self,
                           forCellReuseIdentifier: ProfileCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}