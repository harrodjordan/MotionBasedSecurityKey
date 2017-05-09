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
    
    func getPassword() -> Gyroscope {
        return password;
    }
    
    @IBAction func startRecordingPassword(_ sender: UIButton) {
        
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as! RecordingViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.spinning.startAnimating();
        
        
        //measure changes in acceleration/position
        
        newpass.recording();
       
        //save data to a location
        
        newpass.saveData();
        password = newpass;
        
        secondViewController.spinning.stopAnimating();
        
        
        //move to next view controller
        
        secondViewController.moveToNext();
        
    }
    
    @IBAction func inputtingPassword(_ sender: UIButton) {
        
        
        // record new password
        
        
        //measure changes in acceleration/position
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as! RecordingViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        //secondViewController.viewDidLoad()
        //secondViewController.spinning.startAnimating();
        attempt.recording();
        attempt.saveData();
        //secondViewController.spinning.stopAnimating();
        
        if password.isEqual(attempt: attempt) {
            secondViewController.moveToNext();
        }
            
        else {
            // reject with vibration otherwise
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(startViewController, animated: true)
        }
        
        
        
        
    
    
    }

    

    


}

