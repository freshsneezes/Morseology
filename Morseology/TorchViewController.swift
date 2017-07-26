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

class TorchViewController: UIViewController {
    
    //Access other class
    var homeScreenViewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var lightItUp: UIButton!
    
    //Toggle torch
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
    
    //To switch torch on
    @IBAction func LightItUp(_ sender: Any) {
        
        if let morseTextField = homeScreenViewController.MorseTextField.text?.uppercased() {
            for character in morseTextField.characters {
                if character == "." {
                    torchOn(on: true)
                    print  ("short")
                } else if character == "-" {
                    torchOn(on: true)
                    print ("long")
                } else {
                    torchOn(on: false)
                    print ("pause")
                }
                torchOn(on: false)
            }
        }
    }
    
}
