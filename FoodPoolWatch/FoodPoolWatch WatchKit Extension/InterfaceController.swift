//
//  InterfaceController.swift
//  FoodPoolWatch WatchKit Extension
//
//  Created by Ayşenur Bakırcı on 17.03.2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var tableTitle: WKInterfaceLabel!
    @IBOutlet weak var currentOrdersTable: WKInterfaceTable!
    
    let model = ["restaurant1", "restaurant2", "restaurant3", "restaurant4", "restaurant5"]
    
    override func awake(withContext context: Any?) {
        currentOrdersTable.setNumberOfRows(5, withRowType: "OrderCell")
        
        for (index, name) in model.enumerated() {
            guard let row = currentOrdersTable.rowController(at: index) as? OrderCell else { return }
            row.restaurantName.setText(name)
            row.stateImage.setImage(.add)
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}
