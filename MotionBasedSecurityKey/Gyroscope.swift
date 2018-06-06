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

    
    private var x_Data = [0.0];
    private var y_Data = [0.0];
    private var z_Data = [0.0];
    private var w_Data = [0.0];
    private var roll_Data = [0.0];
    private var pitch_Data = [0.0];
    private var yaw_Data = [0.0];
    
    private static var duration : TimeInterval = 0.1;
    private var all_Data = CMAttitude();
    
    

    
    struct password {
        static var x_Data_pass : [Double] = [0];
        static var y_Data_pass : [Double] = [0];
        static var z_Data_pass : [Double] = [0];
        static var w_Data_pass : [Double] = [0];
        static var roll_Data_pass : [Double] = [0];
        static var pitch_Data_pass : [Double] = [0];
        static var yaw_Data_pass : [Double] = [0];
        
    }
    
    
    //MARK: Actions - Recording inertial sensor measurements and saving them to variables
    
    
    //MARK: getPassword() returns the stored password
    //      Parameters: none
    
    func getPassword() -> Gyroscope.password.Type {
        return password.self; //returns the password for that particular phone
    }
    
    //MARK: recording() records a password in order to either compare it to the existing password or to set a new password
    //      Parameters: none
    // add in a return to save the password
    
    func recording() {
        
        //if record.isDeviceMotionAvailable {
            
            record.deviceMotionUpdateInterval = Gyroscope.duration;  //save all requisite data for the recording
            record.accelerometerUpdateInterval = Gyroscope.duration;
            record.gyroUpdateInterval = Gyroscope.duration;
            record.magnetometerUpdateInterval = Gyroscope.duration;
            
            record.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: {
                (motion: CMDeviceMotion?, Error) -> Void in //record the data

                self.x_Data.append((self.record.deviceMotion?.attitude.quaternion.x)!);
                self.y_Data.append((self.record.deviceMotion?.attitude.quaternion.y)!);
                self.z_Data.append((self.record.deviceMotion?.attitude.quaternion.z)!);
                self.w_Data.append((self.record.deviceMotion?.attitude.quaternion.w)!);
                self.roll_Data.append((self.record.deviceMotion?.attitude.roll)!);
                self.pitch_Data.append((self.record.deviceMotion?.attitude.pitch)!);
               self.yaw_Data.append((self.record.deviceMotion?.attitude.yaw)!);
                
                
               

            })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.record.stopDeviceMotionUpdates() // stop recording
            
            
            password.pitch_Data_pass = self.pitch_Data;
            password.roll_Data_pass = self.roll_Data;
            password.w_Data_pass = self.w_Data;
            password.x_Data_pass = self.x_Data;
            password.y_Data_pass = self.y_Data;
            password.yaw_Data_pass = self.yaw_Data;
            password.z_Data_pass = self.z_Data
            
            
       })

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
