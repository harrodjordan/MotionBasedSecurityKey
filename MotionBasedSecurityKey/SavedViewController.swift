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
    
    private var password: Gyroscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        password = Gyroscope();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getPassword(newpassword: Gyroscope) {
        password = newpassword;
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        
        //measure changes in acceleration/position
        let secondViewController = CheckViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.viewDidLoad()
        
        // record new password
        let attempt = Gyroscope();
        
        //secondViewController.spinning.startAnimating();
        
        attempt.recording();
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        //secondViewController.spinning.stopAnimating();
        
        //ask for previous password and call isPassword
        
        if self.password.isEqual(attempt: attempt) {
            // move back to start recording screen if similar enough
               //secondViewController.buttonRecord.isEnabled = true;
            let recordViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as! RecordingViewController
            self.navigationController?.pushViewController(recordViewController, animated: true)
         
            recordViewController.viewDidLoad()
        }
            
        else {
            // reject with vibration otherwise
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "SavedViewController") as! SavedViewController
            self.navigationController?.pushViewController(thirdViewController, animated: true)
            thirdViewController.viewDidLoad()
            
            
            
        }
        })
}

}

