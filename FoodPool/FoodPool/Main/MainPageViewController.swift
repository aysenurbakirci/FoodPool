//
//  MainViewController.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit
import FoodPoolKit

final class MainPageViewController: UIViewController {
    
    private lazy var mainView = MainPageView()
    var viewModel: MainPageViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.source = self
        viewModel.delegate = self
        viewModel.loadData()
        navigationItem.title = "FoodPool"
    }
}

extension MainPageViewController: UITableViewDelegate {}

extension MainPageViewController: UITableViewDataSource {
    
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
        let selectedSection = viewModel.modelForSection(at: indexPath)

        switch selectedSection {
        case .category(let categoryList):
            let cell: CuisineCell = tableView.dequeue(for: indexPath)
            cell.apply(cuisineList: categoryList)
            return cell
        case .restaurant(let restaurantList):
            let cell: RestaurantCell = tableView.dequeue(for: indexPath)
            let model = restaurantList[indexPath.row]
            cell.apply(imageName: model.imageName, title: model.name, description: model.cuisine, isOpen: model.isOpen)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRestaurant = viewModel.restaurantModelInSection(at: indexPath) else { return }
        let nextPage = DetailPageBuilder.build(model: selectedRestaurant)
        navigationController?.pushViewController(nextPage, animated: true)
    }
}

extension MainPageViewController: MainPageViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.mainView.reloadTableView()
        }
    }
}
