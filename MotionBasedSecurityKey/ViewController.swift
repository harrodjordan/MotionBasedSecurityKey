//
//  ViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 4/25/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//

import UIKit
import CoreMotion
import Gyroscope.swift //figure out how to import other classes

class ViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func startRecordingPassword(_ sender: UIButton) {
        
        //create Gryoscope object
        Gyroscope newpass = Gyroscope();
        
        //measure changes in acceleration/position
        newpass.recording();
       
        //save data to a location
        newpass.saveData();
        
        //change string label to "Done!" once timed out
        
        
        //move to next view controller
        
    }
    
    func inputPassword {
  
    
    // record new password
    // compare to set password 
    // move to an accept screen if similar enough
    // reject with vibration otherwise
        
    }

}

