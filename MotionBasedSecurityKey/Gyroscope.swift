//
//  Gyroscope.swift
//  MotionBasedSecurityKey
//
//  Created by Jordan Harrod on 4/26/17.
//  Copyright © 2017 Jordan Harrod. All rights reserved.
//

import Foundation
import CoreMotion


class Gyroscope {
    

    private var record = CMMotionManager();
    
    private var x_Data : Double = 0;
    private var y_Data : Double = 0;
    private var z_Data : Double = 0;
    private var w_Data : Double = 0;
    private var roll_Data : Double = 0;
    private var pitch_Data : Double = 0;
    private var yaw_Data : Double = 0;
    
    private static var duration : TimeInterval = 20;
    private var all_Data = CMDeviceMotion();
    //private var password = Gyroscope();
    
    
    init() {
        x_Data = 0;
        y_Data = 0;
        z_Data = 0;
        w_Data = 0;
        roll_Data = 0;
        pitch_Data = 0;
        yaw_Data = 0;
        
        all_Data = CMDeviceMotion();
        record = CMMotionManager();

    }
    
    
    //MARK: Actions - Recording inertial sensor measurements and saving them to variables
    
    func recording() {
        
        if record.isDeviceMotionAvailable || !record.isDeviceMotionActive {
            
            record.deviceMotionUpdateInterval = Gyroscope.duration;
            
            record.startDeviceMotionUpdates();
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(20), execute: {
                self.record.stopDeviceMotionUpdates()
            })
            
            all_Data = record.deviceMotion!;
        }
    }
    
    //MARK: saveData() takes global variable all_Data and removes x,y,x accelereter readings
    func saveData() {
        
        x_Data = all_Data.attitude.quaternion.x;
        y_Data = all_Data.attitude.quaternion.y;
        z_Data = all_Data.attitude.quaternion.z;
        w_Data = all_Data.attitude.quaternion.w;
        roll_Data = all_Data.attitude.roll;
        pitch_Data = all_Data.attitude.pitch;
        yaw_Data = all_Data.attitude.yaw;
        
    }
    
    //MARK: isPassword() determines whether the password input matches the stored password
    //      Parameters: none
    
    func isEqual(attempt : Gyroscope) -> Bool {
        
        var count = 0;
        
         //compare to saved password
        
        if attempt.x_Data == self.x_Data {
            count = count + 1;
        }
        
        if attempt.y_Data == self.y_Data {
            count = count + 1;
        }
        
        if attempt.z_Data == self.z_Data {
            count = count + 1;
        }
        
        if attempt.w_Data == self.w_Data {
            count = count + 1;
        }
        
        if attempt.roll_Data == self.roll_Data {
            count = count + 1;
        }
        
        if attempt.yaw_Data == self.yaw_Data {
            count = count + 1;
        }
        
        if attempt.pitch_Data == self.pitch_Data {
            count = count + 1;
        }
        
        //if yes return 1
        if count == 7 {
            return true;
        }
        
        //else return 0
        else {
            return false;
        }
    
    }
        

    
    
    
}
