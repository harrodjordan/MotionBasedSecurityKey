//
//  SavedViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 5/3/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox

class SavedViewController: UIViewController {
    
    private var password = Gyroscope()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        password = Gyroscope();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetPassword(_ sender: UIButton) {
        
        // record new password
        let attempt = Gyroscope();
        
        
        //measure changes in acceleration/position
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "CheckViewController") as! CheckViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        secondViewController.spinning.startAnimating();
        
        attempt.recording();
        attempt.saveData();
        
        secondViewController.spinning.stopAnimating();
       
        password = passViewController.getPassword();
        
        //ask for previous password and call isPassword
        
        if password.isEqual(attempt: attempt) {
            // move back to start recording screen if similar enough
            
            let recordViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as! RecordingViewController
            self.navigationController?.pushViewController(recordViewController, animated: true)
        }
            
        else {
            // reject with vibration otherwise
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "SavedViewController") as! SavedViewController
            self.navigationController?.pushViewController(thirdViewController, animated: true)
            
        }
        
}

}

