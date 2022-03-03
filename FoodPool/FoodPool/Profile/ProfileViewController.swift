//
//  ProfileViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 28.02.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit

final class ProfileViewController: UIViewController {
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.fillSuperView()
        tableView.register(AddressCell.self, forCellReuseIdentifier: AddressCell.reuseIdentifier)
        tableView.register(WalletCell.self, forCellReuseIdentifier: WalletCell.reuseIdentifier)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.reuseIdentifier)
    }
}

extension ProfileViewController: UITableViewDelegate {}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return "Wallet"
        case 2:
            return "Addresses"
        default:
            return "Addresses"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 5
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            let cell: ProfileCell = tableView.dequeue(for: indexPath)
            return cell
        case 1:
            let cell: WalletCell = tableView.dequeue(for: indexPath)
            return cell
        case 2:
            let cell: AddressCell = tableView.dequeue(for: indexPath)
            return cell
        default:
            let cell: AddressCell = tableView.dequeue(for: indexPath)
            return cell
        }
    }
}
