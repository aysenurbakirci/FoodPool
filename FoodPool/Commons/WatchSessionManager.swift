//
//  WatchSessionManager.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 21.03.2022.
//

import WatchConnectivity

typealias MessageReceived = (session: WCSession, message: [String : Any], replyHandler: (([String : Any]) -> Void)?)

protocol WatchOSDelegate: AnyObject {
    func messageReceived(tuple: MessageReceived)
}

protocol iOSDelegate: AnyObject {
    func messageReceived(tuple: MessageReceived)
}

class WatchSessionManager: NSObject {
    static let shared = WatchSessionManager()
    
    weak var watchOSDelegate: WatchOSDelegate?
    weak var iOSDelegate: iOSDelegate?
    
    let session: WCSession? = WCSession.isSupported() ? WCSession.default : nil
    
    var validSession: WCSession? {
        #if os(iOS)
        if let session = session,
            session.isPaired &&
            session.isWatchAppInstalled {
            return session
        }
        return nil
        #elseif os(watchOS)
        return session
        #endif
    }
    
    func startSession() {
        session?.delegate = self
        session?.activate()
    }
}

extension WatchSessionManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive: \(session)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate: \(session)")
        self.session?.activate()
    }
    #endif
}

extension WatchSessionManager {
    private var validReachableSession: WCSession? {
        if let session = validSession, session.isReachable {
            return session
        }
        return nil
    }
    
    func sendMessage(message: [String : AnyObject], replyHandler: (([String : Any]) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        validReachableSession?.sendMessage(message, replyHandler: replyHandler, errorHandler: errorHandler)
    }
    
    func sendMessageData(data: Data, replyHandler: ((Data) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        validReachableSession?.sendMessageData(data, replyHandler: replyHandler, errorHandler: errorHandler)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        handleSession(session, didReceiveMessage: message)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        handleSession(session, didReceiveMessage: message, replyHandler: replyHandler)
    }

    func handleSession(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: (([String : Any]) -> Void)? = nil) {
        
        #if os(iOS)
        iOSDelegate?.messageReceived(tuple: (session, message, replyHandler))
        #elseif os(watchOS)
        watchOSDelegate?.messageReceived(tuple: (session, message, replyHandler))
        #endif
    }
}
