//
//  InterfaceController.swift
//  FoodPoolWatchKit WatchKit Extension
//
//  Created by Ayşenur Bakırcı on 18.03.2022.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    private var session = WCSession.default
    @IBOutlet weak var orderTable: WKInterfaceTable!

    private var titles = ["Burger King", "Popeyes", "McDonalds", "KFC", "Arbys"] {
        didSet {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
    }
    
    private func updateTable() {
        orderTable.setNumberOfRows(titles.count, withRowType: "OrderCellIdentifier")
        
        for (index, restaurant) in titles.enumerated() {
            guard let row = orderTable.rowController(at: index) as? OrderCell else {
                return
            }
            row.restaurantTitle?.setText(restaurant)
            row.statusIcon?.setImage(UIImage(systemName: "trash.circle.fill"))
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        titles.append("Add New Row")
    }
    
    override func willActivate() {
        super.willActivate()
        
        if isSupported() {
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    private func isSupported() -> Bool {
        return WCSession.isSupported()
    }
    
    private func isReachable() -> Bool {
        return session.isReachable
    }
    
    @IBAction func didTapRefreshButton() {
        if isReachable() {
            session.sendMessage(["request" : "version"], replyHandler: { (response) in
                self.titles.append("Reply: \(response)")
            }, errorHandler: { (error) in
                print("Error sending message: %@", error)
            })
        } else {
            print("iPhone is not reachable!!")
        }
    }
}

extension InterfaceController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
}
