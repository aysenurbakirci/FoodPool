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

final class ProfilePageViewController: UIViewController {
    
    lazy var profileView = ProfilePageView()
    var viewModel: ProfilePageViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        profileView.source = self
        
        viewModel.loadData()
    }
}

extension ProfilePageViewController: UITableViewDelegate {}

extension ProfilePageViewController: UITableViewDataSource {
    
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
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell: WalletCell = tableView.dequeue(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell: AddressCell = tableView.dequeue(for: indexPath)
            cell.selectionStyle = .none
            return cell
        default:
            let cell: AddressCell = tableView.dequeue(for: indexPath)
            return cell
        }
    }
}
