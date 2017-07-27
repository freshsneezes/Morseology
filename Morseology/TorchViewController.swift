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
    
    var morseCode = ""
    
    @IBAction func lightButton(_ sender: Any) {
        flash(forMorseCode: morseCode)
    }
    
    func flash(forMorseCode code: String) {
        // Start recursive function at index 0
        flashForValue(atIndex: 0, ofInput: code)
    }
    
    private func flashForValue(atIndex index: Int, ofInput input: String) {
        // Stop condition for recursive function
        if index >= input.characters.count {
            return
        }
        
        // Convert integer index to string.index :unamused: should use arrays instead of strings
        let charIndex = input.index(input.startIndex, offsetBy: index)
        let inputChar = input.characters[charIndex]
        
        if inputChar != " " {
            // Is not a space so turn light on
            toggleFlash()
        }
        if inputChar == "." {
            // is dot, turn flash off after one second
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.toggleFlash()
                // Advance to next character in input
                self.flashForValue(atIndex: index + 1, ofInput: input)
            })
        } else if inputChar == "-" {
            // is dash, turn flash off after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.toggleFlash()
                // Advance to next character in input
                self.flashForValue(atIndex: index + 1, ofInput: input)
            })
        } else {
            // is something other than dash or dot, wait one second before advancing
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.flashForValue(atIndex: index + 1, ofInput: input)
            })
        }
    }
    
    // Turns flash on if currently off or turns flash off if currently on
    private func toggleFlash() {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        if (device.hasTorch) {
            do {
                try device.lockForConfiguration()
                if (device.torchMode == AVCaptureTorchMode.on) {
                    device.torchMode = AVCaptureTorchMode.off
                } else {
                    do {
                        try device.setTorchModeOnWithLevel(1.0)
                    } catch {
                        print(error)
                    }
                }
                device.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
 
    
    /* Our stuff
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
    */
}
