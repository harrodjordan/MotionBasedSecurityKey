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
     var password: Gyroscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        spinning = UIActivityIndicatorView()


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
       if let destinationViewController = segue.destination as? SavedViewController {
            destinationViewController.password = self.password
        }
    }
    
    @IBAction func moveToNext(_ sender: UIButton) {
        let thirdViewController = SavedViewController()
        
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        
        
        thirdViewController.viewDidLoad()
    }
  
 
    
}

