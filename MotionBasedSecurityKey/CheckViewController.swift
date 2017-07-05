//
//  CheckViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 5/3/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//


import UIKit
import Foundation

// JH: Unchanged from the original Xcode specifications
// JH: Created in order to utilize the CheckViewController in other areas of the application, this ViewController is transient.


class CheckViewController: UIViewController {
    
    @IBOutlet weak var spinning: UIActivityIndicatorView! //spinning circle object to indicate processing
     var password: Gyroscope!
    //@IBOutlet weak var buttonRecord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        spinning = UIActivityIndicatorView(); //check to see whether the object is turned on when running 
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
