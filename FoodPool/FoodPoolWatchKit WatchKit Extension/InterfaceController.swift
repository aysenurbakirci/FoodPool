//
//  InterfaceController.swift
//  FoodPoolWatchKit WatchKit Extension
//
//  Created by Ayşenur Bakırcı on 18.03.2022.
//

import WatchKit
import Foundation
import WatchConnectivity


public struct Order: Decodable {
    public var id: Int
    public var userID: String
    public var state: String
    public var restaurantName: String
}


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var orderTable: WKInterfaceTable!
    
    private var orderList: [Order] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        getData()
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}

extension InterfaceController {
    
    private func updateTable() {
        orderTable.setNumberOfRows(orderList.count, withRowType: "OrderCellIdentifier")
        
        for (index, order) in orderList.enumerated() {
            guard let row = orderTable.rowController(at: index) as? OrderCell else {
                return
            }
            row.restaurantTitle?.setText(order.restaurantName)
            if order.state == "preparing" {
                row.statusIcon?.setImage(UIImage(systemName: "lanyardcard.fill"))
            } else if order.state == "ready" {
                row.statusIcon?.setImage(UIImage(systemName: "bag.fill"))
            } else if order.state == "onTheWay" {
                row.statusIcon?.setImage(UIImage(systemName: "paperplane.fill"))
            } else {
                row.statusIcon?.setImage(UIImage(systemName: "clock.fill"))
            }
        }
    }
    
    private func getData() {
        let urlString = "http://localhost:3000/currentOrders?userID=\(UserInfo.userID)"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                   let decodedData = try JSONDecoder().decode([Order].self, from: data)
                   print(decodedData)
                    self.orderList.append(contentsOf: decodedData)
                } catch let error {
                   print(error)
                }
             }
        }.resume()
    }
}
