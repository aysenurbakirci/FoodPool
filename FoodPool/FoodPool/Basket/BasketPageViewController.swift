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
    
    //MARK: - Properties
    lazy var basketView = BasketPageView()
    var viewModel: BasketPageViewModelProtocol!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view = basketView
        basketView.source = self
        navigationItem.title = "Basket"
    }
}

//MARK: - TableView Methods
extension BasketPageViewController: UITableViewDelegate {}

extension BasketPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.reuseIdentifier) as? HeaderView else {
            return nil
        }
        let model = viewModel.headerModel(in: section)
        view.apply(imageName: model.restaurantImage, restaurant: model.restaurantName)
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == (viewModel.numberOfSections() - 1) else { return UIView() }
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterView.reuseIdentifier) as? FooterView else {
            return UIView()
        }
        view.apply(amount: 28.5)
        view.addTarget(self, selector: #selector(handleTap))
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasketCell = tableView.dequeue(for: indexPath)
        let model = viewModel.mealListInSection(at: indexPath)
        cell.apply(title: model.mealName, price: model.price, count: Double(model.count))
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteItem(at: indexPath)
            if viewModel.deleteSection {
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
                tableView.reloadData()
            } else {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension BasketPageViewController {
    @objc func handleTap() {
        print("click")
    }
}
