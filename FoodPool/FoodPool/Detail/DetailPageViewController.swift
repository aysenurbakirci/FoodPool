//
//  DetailPageViewController.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit

final class DetailPageViewController: UIViewController {
    
    //MARK: - Properties
    private lazy var detailView = DetailPageView()
    var viewModel: DetailPageViewModelProtocol!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        detailView.source = self
    }
}

//MARK: - TableView Methods
extension DetailPageViewController: UITableViewDelegate {}

extension DetailPageViewController: UITableViewDataSource {
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
        case .restaurant(let restaurant):
            let cell: RestaurantCell = tableView.dequeue(for: indexPath)
            cell.apply(imageName: restaurant.imageName,
                       title: restaurant.name,
                       description: restaurant.address)
            return cell
        case .mealList(let mealList):
            let cell: MealCell = tableView.dequeue(for: indexPath)
            let model = mealList[indexPath.row]
            cell.apply(imageName: model.imageName,
                       title: model.name,
                       price: String(model.price))
            cell.addTarget(self, selector: #selector(handleTap))
            return cell
        case .drinkList(let drinkList):
            let cell: MealCell = tableView.dequeue(for: indexPath)
            let model = drinkList[indexPath.row]
            cell.apply(imageName: model.imageName,
                       title: model.name,
                       price: String(model.price))
            cell.addTarget(self, selector: #selector(handleTap))
            return cell
        }
    }
}

extension DetailPageViewController {
    @objc func handleTap() {
        print("Clicked")
    }
}
