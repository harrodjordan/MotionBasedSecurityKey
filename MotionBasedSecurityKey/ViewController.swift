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

    private var attempt = Gyroscope();
    private var newpass = Gyroscope();
    private var password = Gyroscope();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        attempt = Gyroscope();
        newpass = Gyroscope();
        password = Gyroscope();
        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func startRecordingPassword(_ sender: UIButton) {
        
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as! RecordingViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.viewDidLoad()
        
        
        //measure changes in acceleration/position
        
        newpass.recording();
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            //newpass.saveData();
            self.password = self.newpass;
            
            
            //move to next view controller
            
            secondViewController.getPassword(newpassword: self.password);
            
        })

        
       
        
        
        
        
    }
    
    @IBAction func inputtingPassword(_ sender: UIButton) {
        
        
        // record new password
        
        
        //measure changes in acceleration/position
        
        let secondViewController = RecordingViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.viewDidLoad()
        //secondViewController.spinning.startAnimating();
        attempt.recording();
       //attempt.saveData();
        //secondViewController.spinning.stopAnimating();
        
        if password.isEqual(attempt: attempt) {
            //change text and allow button to be pressed
            //secondViewController.buttonDone.isEnabled = true;
        }
            
        else {
            // reject with vibration otherwise
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            let startViewController = ViewController()
            self.navigationController?.pushViewController(startViewController, animated: true)
            startViewController.viewDidLoad()
        }
        
        
        
        
    
    
    }

    

    


}

