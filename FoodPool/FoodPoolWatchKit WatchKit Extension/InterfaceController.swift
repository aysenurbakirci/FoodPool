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
    
    @IBOutlet weak var orderTable: WKInterfaceTable!
    var session: WCSession?
    var connectivityHandler = WatchSessionManager.shared
    var counter = 0
    
    private var titles = ["Burger King", "Popeyes", "McDonalds", "KFC", "Arbys"] {
        didSet {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        titles.append("Are You Readyy")
    }
    
    override func willActivate() {
        super.willActivate()
        connectivityHandler.startSession()
        connectivityHandler.watchOSDelegate = self
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    @IBAction func didTapRefreshButton() {
        //MARK: - Version
        let data = ["request" : RequestType.version.rawValue as AnyObject]
        connectivityHandler.sendMessage(message: data, replyHandler: { (response) in
            self.titles.append("Reply: \(response)")
        }) { (error) in
            print("Error sending message: \(error)")
        }
        
        //MARK: - Date
        /*
         let data = ["request" : RequestType.date.rawValue as AnyObject]
         connectivityHandler.sendMessage(message: data, replyHandler: { (response) in
             self.messages.append("Reply: \(response)")
         }) { (error) in
             print("Error sending message: \(error)")
         }
         */
    }
}

extension InterfaceController {
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
}

extension InterfaceController: WatchOSDelegate {
    
    func messageReceived(tuple: MessageReceived) {
        DispatchQueue.main.async() {
            WKInterfaceDevice.current().play(.notification)
            if let msg = tuple.message["msg"] {
                self.titles.append("\(msg)")
            }
        }
    }
}
