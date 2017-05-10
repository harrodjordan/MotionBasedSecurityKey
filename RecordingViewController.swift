//
//  RecordingViewController.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 5/3/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//

import UIKit
import Foundation

class RecordingViewController: UIViewController {
    
    @IBOutlet weak var spinning: UIActivityIndicatorView!
    private var password: Gyroscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        spinning = UIActivityIndicatorView()
        password = Gyroscope();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToNext() {
        let thirdViewController = SavedViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        thirdViewController.getPassword(newpassword: password);
        
        thirdViewController.viewDidLoad()
        
        
        
    }
    
    func getPassword(newpassword: Gyroscope) {
        password = newpassword;
    }
    
}

