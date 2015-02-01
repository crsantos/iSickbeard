//
//  ViewController.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let server1 = Server(name: "Sickbeard1", address: "http://192.168.1.70:8081/sickbeard", apiKey:"d0e18c0b7e094784539467ef7e0eb9ea");
        debugPrintln(server1)
        
        let show1 = Show(name:"Lost", quality:.QualitySettingNA)
        debugPrintln(show1);
        
        // Test Ping
        Sickbeard.Router.currentServer = server1
        let request = Alamofire.request(Sickbeard.Router.Ping()).validate()
            .responseJSON { (_, _, json, error) in
                println(error)
                
                println(json)
        }
        
        println(request)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

