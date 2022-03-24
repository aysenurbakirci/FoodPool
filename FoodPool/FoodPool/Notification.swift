//
//  Notification.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 24.03.2022.
//

import Foundation
import UserNotifications

final class Notification {
    static let shared = Notification()
    
    let notifyCenter = UNUserNotificationCenter.current()

    func createNotification(title: String, body: String) {
        let uuidString = UUID().uuidString
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 600.00, repeats: false)
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        notifyCenter.add(request) { error in
            print(String(describing: error?.localizedDescription))
        }
    }
    
    func requestAuth() {
        notifyCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Permission Granted!")
            }else {
                print("Permission Denied!")
            }
        }
    }
}
