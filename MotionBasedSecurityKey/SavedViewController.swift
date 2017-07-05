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
    
     var password: Gyroscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destinationViewController = segue.destination as? CheckViewController {
            destinationViewController.password = self.password
        }
    }

    //MARK: resetPassword() resets the existing password by overwriting the data with the new recorded input
    //      Parameters: UIButton - must be pressed in order to call the method
    
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

