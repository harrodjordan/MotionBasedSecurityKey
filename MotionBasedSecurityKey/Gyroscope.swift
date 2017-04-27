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
    

    private var record = CMSensorRecorder();
    private var x_Data = 0;
    private var y_Data = 0;
    private var z_Data = 0;
    private static var duration = 20
    private var all_Data = CMSensorDataList();
    private var password = Gyroscope();
    
    
    
    
    
    //Mark: Actions - Recording inertial sensor measurements and saving them to variables
    
    func recording() {
        if CMSensorRecorder.isAccelerometerRecordingAvailable() {
            let record = CMSensorRecorder();
            record.recordAccelerometer(forDuration: TimeInterval(Gyroscope.duration));
            
            all_Data = record.accelerometerData(from: NSDate.distantPast, to: NSDate.distantFuture)!;
        }
    }
    
    func saveData() {
        
        self.all_Data
    }
    
    func setPassword() {
        password.saveData();
    }
    
    func printData() {
        
    }
    
    
    
}
