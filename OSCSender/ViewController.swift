//
//  ViewController.swift
//  OSCSender
//
//  Created by natari on 2019/06/10.
//  Copyright © 2019 massv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let oscClient = F53OSCClient.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        oscClient.host = "172.24.21.99"
        oscClient.port = 3333
    }
    
    @IBAction func sendOSC(){
        //123というメッセージをOSCで送信
        self.sendMessage(client: oscClient, addressPattern: "/value", arguments: [123 as AnyObject])
        //複数の値を送る場合はarguments:[123,231,312]
    }
    
    func sendMessage(client: F53OSCClient, addressPattern: String, arguments: [AnyObject]) {
        let message: F53OSCPacket = F53OSCMessage(addressPattern: addressPattern, arguments: arguments)
        client.send(message)
        print("Sent '\(message)' to \(client.host):\(client.port)")
    }
}
