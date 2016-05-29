//
//  InterfaceController.swift
//  WatchCommMixed WatchKit Extension
//
//  Created by artist on 5/28/16.
//  Copyright © 2016 Ever8greener. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {
    
    // ------------------------------------ WCSession init !!!!
    
    let session:WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    override init() {
        super.init()
        
        configureWCSession()
    }
    
    private func configureWCSession() {
        session?.delegate = self;
        session?.activateSession()
    }
    
    
    
    // ------------------------------------ Context RX
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String:AnyObject]) {
        
        print("rx deleated called")
        
        let received = applicationContext["appData"] as? String
        
        dispatch_async(dispatch_get_main_queue()) { // for faster UI
            if let received = received {
                
                print("data: \(received)")
                self.contextLabel.setText("data: \(received)")
            }
        }
        
    }

    
    
 
    // ------------------------------------ Im RX
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        dispatch_async(dispatch_get_main_queue()) { // for faster UI

        if let counter = message["appCounter"] {
            
            print("app data : \(counter)")
            
            self.instantLabel.setText("ha:\(counter)")
        }
            
        }
    }

    
    
    
    
    
    @IBOutlet var instantLabel: WKInterfaceLabel!
    
    
    @IBOutlet var contextLabel: WKInterfaceLabel!
    
    
    
 
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
