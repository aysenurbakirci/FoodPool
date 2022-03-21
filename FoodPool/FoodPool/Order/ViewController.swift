//
//  ViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 21.03.2022.
//

import Foundation
import UIKit
import WatchConnectivity
import LayoutKit
import FoodPoolKit

class ViewController: UIViewController {
    
    var connectivityHandler = WatchSessionManager.shared
    var counter = 0
    
    lazy var button: UIButton = .create(
        type: .system,
        title: "SEND",
        titleColor: .white,
        font: .medium,
        numberOfLines: 0,
        backgroundColor: .mainColor,
        sizeToFit: true,
        horizontalAlignment: .center,
        verticalAlignment: .center
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.backgroundColor = .white
        button.centerToSuperView()
        connectivityHandler.iOSDelegate = self
        button.addTarget(self, action: #selector(sendMessage(_:)), for: .touchUpInside)
    }
    
    @objc func sendMessage(_ sender: UIButton) {
        counter += 1
        connectivityHandler
            .sendMessage(message: ["msg" : "Message \(counter)" as AnyObject],
                         errorHandler:  { (error) in
            print("Error sending message: \(error)")
        })
    }
}

extension ViewController: iOSDelegate {
    
    func messageReceived(tuple: MessageReceived) {
        guard let reply = tuple.replyHandler else {
            return
        }
    
        switch tuple.message["request"] as! RequestType.RawValue {
        case RequestType.date.rawValue:
            reply(["date" : "\(Date())"])
        case RequestType.version.rawValue:
            let version = ["version" : "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "No version")"]
            reply(["version" : version])
        default:
            break
        }
    }
}
