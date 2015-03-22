//
//  ViewController.swift
//  指紋認証-swift
//
//  Created by 加藤 周 on 2015/03/22.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    @IBOutlet var label:UILabel!
    var myAuthContext : LAContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateMySecurityLabel(success: Bool) {
        dispatch_async(dispatch_get_main_queue(),{
            if success {
                println("認証成功")
                self.label.text = "認証成功"
            } else {
                println("認証失敗")
                self.label.text = "認証失敗"
            }
        })
    }

    @IBAction func start(sender: AnyObject) {
        if myAuthContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: nil) {
            myAuthContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics,
                localizedReason: "テスト認証",
                reply: {(success: Bool, error: NSError!) -> Void in
                    self.updateMySecurityLabel(success)
            })
        }
    }
    
}

