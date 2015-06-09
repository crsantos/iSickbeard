//
//  AboutViewController.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import UIKit
import Alamofire

class AboutViewController: UIViewController {

    
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var buildLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupVersionLabels()
        
        self.requestShowList()
    }

    // MARK: - Private
    
    func setupVersionLabels() {
        
        self.versionLabel.text = NSBundle.applicationVersionNumber
        self.buildLabel.text   = NSBundle.applicationBuildNumber
    }
    
    func requestShowList() {
        
        let server1 = Server(
            name: "Sickbeard1",
            address: "http://192.168.1.70:8081/sickbeard",
            apiKey:"d0e18c0b7e094784539467ef7e0eb9ea"
        );
        
        let server2 = Server(
            name: "Sickbeard2",
            address: "http://crsantos.ddns.net:8081",
            apiKey:"0e1441393aa482f300ca0553991a8fc4"
        );
        
        debugPrintln(server1)
        
        let show1 = Show(
            name: "Lost",
            indexerId: 12314,
            airs: "Sunday, 8/9Central",
            quality: .QualitySettingNA
        )
        debugPrintln(show1);
        
        // Test Ping
        let request = Sickbeard(server: server2).History(3) { (response, shows) -> () in
            
            if response.status == .Success {
                
                println(shows)
            }
        }
        
        println(request)
    }
    
    // MARK: - Lifecycle
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

