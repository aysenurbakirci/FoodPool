//
//  OrderViewController.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class OrderPageViewController: UIViewController {
    
    private lazy var orderView = OrderPageView()
    var viewModel: OrderPageViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
        orderView.source = self
        navigationItem.title = "Orders"
        
        viewModel.loadData()
    }
}

extension OrderPageViewController: UITableViewDelegate {}

extension OrderPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.modelForSection(at: indexPath)
        let cell: OrderCell = tableView.dequeue(for: indexPath)
        switch model {
        case .current(let currentOrders):
            let model = currentOrders[indexPath.row]
            cell.apply(title: model.restaurantName, meals: model.mealList, total: model.price)
        case .previous(let previousOrders):
            let model = previousOrders[indexPath.row]
            cell.apply(title: model.restaurantName, meals: model.mealList, total: model.price)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newPage = OrderDetailPageBuilder.build()
        navigationController?.pushViewController(newPage, animated: true)
    }
}
