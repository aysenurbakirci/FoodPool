//
//  Notification.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 24.03.2022.
//

import Foundation
import UserNotifications

class Notification {

    static func createNotification(title: String, body: String) {
        let uuidString = UUID().uuidString
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 600.00, repeats: false)
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            print(String(describing: error?.localizedDescription))
        }
    }
}
