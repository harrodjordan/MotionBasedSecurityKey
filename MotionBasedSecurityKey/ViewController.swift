//
//  ViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 4/25/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//

import UIKit
import CoreMotion


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
        let newpass = Gyroscope();
        
        //measure changes in acceleration/position
        newpass.recording();
       
        //save data to a location
        newpass.saveData();
        newpass.setPassword();
        
        //change string label to "Done!" once timed out
        
        
        //move to next view controller
        
    }
    
    func inputPassword {
  
    
    // record new password
    // compare to set password 
    // move to an accept screen if similar enough
    // reject with vibration otherwise
        
    }
    
    //MARK: isPassword() determines whether the password input matches the stored password
    //      Parameters: none
    
    func isPassword() {
        //load password input
        //compare to saved password
        //if yes return 1
        //else return 0
    }
    
    func resetPassword() //button attached  
    {
        //ask for previous password
        //call isPassword 
        //if yes, cann startRecordingPassword
        //if no, shake and return to home view
    }

}

