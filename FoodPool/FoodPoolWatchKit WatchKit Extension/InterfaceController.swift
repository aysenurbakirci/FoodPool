//
//  InterfaceController.swift
//  FoodPoolWatchKit WatchKit Extension
//
//  Created by Ayşenur Bakırcı on 18.03.2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var orderTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        orderTable.setNumberOfRows(5, withRowType: "OrderCellIdentifier")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
