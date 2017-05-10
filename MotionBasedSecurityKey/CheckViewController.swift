//
//  CheckViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 5/3/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//


import UIKit
import Foundation

class CheckViewController: UIViewController {
    
    @IBOutlet weak var spinning: UIActivityIndicatorView!
    private var password: Gyroscope!
    //@IBOutlet weak var buttonRecord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        spinning = UIActivityIndicatorView();
        password = Gyroscope();
        //buttonRecord = UIButton();
       // buttonRecord.isEnabled = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPassword(newpassword: Gyroscope) {
        password = newpassword;
    }
    
    
}
