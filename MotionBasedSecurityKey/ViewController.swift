//
//  ViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 4/25/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//

import UIKit
import CoreMotion
import AudioToolbox


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
    
    @IBAction func inputtingPassword(_ sender: UIButton) {
        
        
        // record new password
        let attempt = Gyroscope();
        
        
        //measure changes in acceleration/position
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as! RecordingViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.spinning.startAnimating();
        attempt.recording();
        attempt.saveData();
        secondViewController.spinning.stopAnimating();
        
        if attempt.isPassword() {
            let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "SavedViewController") as! RecordingViewController
            self.navigationController?.pushViewController(thirdViewController, animated: true)
        }
            
        else {
            // reject with vibration otherwise
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! RecordingViewController
            self.navigationController?.pushViewController(startViewController, animated: true)
        }
        
    }

    
    
        
    

}

