//
//  OrderViewController.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import RxSwift

final class OrderPageViewController: UIViewController, ActivityDisplayer {
    
    private lazy var orderView = OrderPageView()
    var viewModel = OrderPageViewModel()
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = orderView
        navigationItem.title = "Orders"
        orderView.source = self
        viewModel.delegate = self
        viewModel.loadData()
        bindLoading()
        bindErrorHandling()
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
        let model = viewModel.modelForSection(at: indexPath)
        
        switch model {
        case .current(let currentOrders):
            let order = currentOrders[indexPath.row]
            let page = OrderDetailPageBuilder.build(selectedOrder: order)
            navigationController?.pushViewController(page, animated: true)
        case .previous(let previousOrders):
            let order = previousOrders[indexPath.row]
            let page = OrderDetailPageBuilder.build(selectedOrder: order)
            navigationController?.pushViewController(page, animated: true)
        }
    }
}

extension OrderPageViewController: OrderPageViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.orderView.reloadTableView()
        }
    }
}
