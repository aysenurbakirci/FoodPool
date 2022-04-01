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
    lazy var emptyBasketView = EmptyBasketView()
    var viewModel: BasketPageViewModelProtocol!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view = emptyBasketView
        navigationItem.title = "FoodPool"
        basketView.source = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        basketView.reloadTable()
        if viewModel.basketIsEmpty {
            view = emptyBasketView
        } else {
            view = basketView
        }
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
        view.apply(amount: viewModel.calcTotal())
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
        
            if viewModel.deleteItem(at: indexPath) {
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
                tableView.reloadData()
            } else {
                tableView.deleteRows(at: [indexPath], with: .fade)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    tableView.reloadData()
                }
            }
            
            if viewModel.numberOfSections() == 0 {
                view = emptyBasketView
            }
        }
    }
}

extension BasketPageViewController {
    @objc func handleTap() {
        viewModel.resetBasket()
        view = emptyBasketView
        showToast(message: "Your order is created 🥳")
        Notification.shared.createNotification(title: "FoodPool", body: "What is the latest status of your order? If you want to check, you can view your order status at any time.")
    }
}
