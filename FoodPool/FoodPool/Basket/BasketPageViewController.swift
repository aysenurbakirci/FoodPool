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
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.reuseIdentifier) as? HeaderView else {
            return nil
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 2 else { return UIView() }
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterView.reuseIdentifier) as? FooterView else {
            return UIView()
        }
        return view

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasketCell = tableView.dequeue(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            viewModel.deleteItem(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
