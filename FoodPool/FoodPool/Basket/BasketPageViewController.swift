//
//  BasketPageViewController.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class BasketPageViewController: UIViewController {
    
    lazy var basketView = BasketPageView()
    var viewModel: BasketPageViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = basketView
        basketView.source = self
        navigationItem.title = "Basket"
    }
}

extension BasketPageViewController: UITableViewDelegate {}

extension BasketPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let basketModel = viewModel.modelForSection(in: section)
        switch basketModel {
        case .restaurant(_):
            return nil
        case .mealList(_):
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterView.reuseIdentifier) as? FooterView else {
                return nil
            }
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basketModel = viewModel.modelForSection(in: indexPath.section)
        switch basketModel {
        case .restaurant(let string):
            let cell: RestaurantCell = tableView.dequeue(for: indexPath)
            cell.apply(imageName: "image", title: string, description: "Description")
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell.directionalLayoutMargins = .zero
            return cell
        case .mealList(let mealList):
            let cell: BasketCell = tableView.dequeue(for: indexPath)
            let model = mealList[indexPath.row]
            cell.apply(title: model.mealName, price: model.price, count: model.count)
            cell.addTarget(self)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteItem(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
