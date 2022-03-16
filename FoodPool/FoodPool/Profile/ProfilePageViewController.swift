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
import RxSwift

final class ProfilePageViewController: UIViewController, ActivityDisplayer {
    
    //MARK: - Properties
    lazy var profileView = ProfilePageView()
    var viewModel = ProfilePageViewModel()
    var bag = DisposeBag()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        profileView.source = self
        viewModel.delegate = self
        viewModel.loadData()
        bindLoading()
        bindErrorHandling()
    }
}

//MARK: - TableView Methods
extension ProfilePageViewController: UITableViewDelegate {}

extension ProfilePageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = viewModel.modelForSection(at: indexPath)
        switch sectionModel {
        case .profile(let user):
            let cell: ProfileCell = tableView.dequeue(for: indexPath)
            cell.apply(userName: "\(user.name) \(user.surname)", email: user.email, phone: user.phone)
            return cell
        case .wallet(let amount):
            let cell: WalletCell = tableView.dequeue(for: indexPath)
            cell.apply(amount: Double(amount))
            cell.addButtonTarget(addButtonTarget: self, addButtonSelector: #selector(add))
            return cell
        case .address(let addressList):
            let cell: AddressCell = tableView.dequeue(for: indexPath)
            let address = addressList[indexPath.row]
            cell.apply(title: address.title, address: address.address)
            cell.addButtonTarget(editButtonTarget: self, editButtonSelector: #selector(edit))
            return cell
        case .button:
            let cell: ButtonCell = tableView.dequeue(for: indexPath)
            cell.addButtonTarget(target: self, selector: #selector(add))
            return cell
        }
    }
}

//MARK: - Button Methods
extension ProfilePageViewController {
    @objc func add() {
        print("Clicked add button")
    }
    
    @objc func edit() {
        print("Clicked edit button")
    }
}

//MARK: - Reload Page
extension ProfilePageViewController: ProfilePageViewModelDelegate {
    func reloadTableView() {
        profileView.reloadTableView()
    }
}
