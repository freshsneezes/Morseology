//
//  TorchViewController.swift
//  Morseology
//
//  Created by its on 24/7/2017.
//  Copyright © 2017 Nerds In A Room. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class TorchViewController: UIViewController{
    
    //To switch torch on
    func torchOn(on: Bool) {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                    print ("Torch is on")
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print ("Torch could not be used")
            }
        } else {
            print ("Torch is not available")
        }
    }
    
    //To call torch function: torchOn(on: true)
    
}
