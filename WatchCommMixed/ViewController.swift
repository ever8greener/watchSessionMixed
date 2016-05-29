//
//  ViewController.swift
//  WatchCommMixed
//
//  Created by artist on 5/28/16.
//  Copyright © 2016 Ever8greener. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController , WCSessionDelegate{
    
    let session:WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    private func configureWCSession(){
        session?.delegate = self
        session?.activateSession()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureWCSession()
        
    }
    
    
    
    
    
    // auto generated code by XCODE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target:self, selector:#selector(updateCounter), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    //CONTEXT
    
    func sendTextUsingContext(aString:String){
        
        let appDict = ["appData" : aString]
        
        do {
            try session?.updateApplicationContext(appDict)
            
            print("item sent")
        } catch{
            print("err in sending conTexxT")
        }
    }

    
    //IM
    
    var counter : Int = 1
    
    func sendIMData (){
        
        
        var appData = ["appCounter": counter ]
        appData   ["appTime"] =  36
        
        counter += 1
        
        if let session = session where session.reachable{
            session.sendMessage(appData, replyHandler: { replyData in
                
                print(replyData)
                
                }, errorHandler: { error in
                    
                    print(error)
            })
        }else{
            print("bt erroR!!")
        }
    }

    
    
    
    
    
    
    
    
    //IBOutlets
    
    @IBAction func sendIM(sender: AnyObject) {
        sendIMData()
    }
    
    
    @IBAction func sendContextOne(sender: AnyObject) {
        sendTextUsingContext("earth")
    }
    
    @IBAction func sendContextTwo(sender: AnyObject) {
        sendTextUsingContext("water")
    }
    
    
    //TIMER EXPERIMENT
    
    func updateCounter()  {
        
        sendIMData()
        
    }
    
    
}

