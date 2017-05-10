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
    

    let record = CMMotionManager();

    
    private var x_Data : Double = 0;
    private var y_Data : Double = 0;
    private var z_Data : Double = 0;
    private var w_Data : Double = 0;
    private var roll_Data : Double = 0;
    private var pitch_Data : Double = 0;
    private var yaw_Data : Double = 0;
    
    private static var duration : TimeInterval = 0.1;
    private var all_Data = CMAttitude();
    
    
    
    init() {
        x_Data = 0;
        y_Data = 0;
        z_Data = 0;
        w_Data = 0;
        roll_Data = 0;
        pitch_Data = 0;
        yaw_Data = 0;
        
        all_Data = CMAttitude();

    }
    
    struct password {
        var x_Data : Double = 0;
        var y_Data : Double = 0;
        var z_Data : Double = 0;
        var w_Data : Double = 0;
        var roll_Data : Double = 0;
        var pitch_Data : Double = 0;
        var yaw_Data : Double = 0;
        
        

    }
    
    
    //MARK: Actions - Recording inertial sensor measurements and saving them to variables
    
    func getPassword() -> Gyroscope.password.Type {
        return password.self;
    }
    
    func recording() {
    
        
        let data = CMDeviceMotionHandler();
        
        if record.isDeviceMotionAvailable {
            
            record.deviceMotionUpdateInterval = Gyroscope.duration;
            record.accelerometerUpdateInterval = Gyroscope.duration;
            record.gyroUpdateInterval = Gyroscope.duration;
            record.magnetometerUpdateInterval = Gyroscope.duration;
            
            record.startDeviceMotionUpdates();
            record.startGyroUpdates()
            record.startAccelerometerUpdates()
            record.startMagnetometerUpdates()
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                self.record.stopDeviceMotionUpdates()
                self.record.stopGyroUpdates()
                self.record.stopAccelerometerUpdates()
                self.record.stopMagnetometerUpdates()
            })
            
            all_Data = record.deviceMotion!.attitude;
            self.saveData();
            
        }
        
        else {
            print("Core Motion Not Available")
                }
    }
    
    //MARK: saveData() takes global variable all_Data and removes x,y,x accelereter readings
    func saveData() {
        
        x_Data = all_Data.quaternion.x;
        y_Data = all_Data.quaternion.y;
        z_Data = all_Data.quaternion.z;
        w_Data = all_Data.quaternion.w;
        roll_Data = all_Data.roll;
        pitch_Data = all_Data.pitch;
        yaw_Data = all_Data.yaw;
        
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
