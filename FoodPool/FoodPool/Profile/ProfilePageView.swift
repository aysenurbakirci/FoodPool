//
//  ProfileView.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 25.02.2022.
//

import Foundation
import UIKit
import FoodPoolKit

class ProfilePageView: UIViewController {
    
    lazy var profileView = ProfileView()
    
    lazy var profileTable: UITableView = .createTable(
        style: .plain,
        estimatedRowHeight: 100,
        backgroundColor: .clear,
        headerView: profileView,
        addCells: [AddressCell.self, WalletCell.self]
    )
    
    
    
}
