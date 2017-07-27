//
//  AudioViewController.swift
//  Morseology
//
//  Created by its on 24/7/2017.
//  Copyright © 2017 Nerds In A Room. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import SwiftySound

class AudioViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var AudioGif: UIImageView!
    
    var morseCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioGif.loadGif(name: "Fake Soundwave")
    }


    
    private func soundForValue(atIndex index: Int, ofInput input: String) {
        // Stop condition for recursive function
        if index >= input.characters.count {
            return
        }
        
        // Convert integer index to string.index :unamused: should use arrays instead of strings
        let charIndex = input.index(input.startIndex, offsetBy: index)
        let inputChar = input.characters[charIndex]
        
        if inputChar != " " {
            // Is not a space so turn light on
            Sound.play(file: "longerBeep.mp3")
        }
        if inputChar == "." {
            // is dot, turn flash off after one second
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                Sound.stopAll()
                // Advance to next character in input
                self.soundForValue(atIndex: index + 1, ofInput: input)
            })
        } else if inputChar == "-" {
            // is dash, turn flash off after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                Sound.stopAll()
                // Advance to next character in input
                self.soundForValue(atIndex: index + 1, ofInput: input)
            })
        } else {
            // is something other than dash or dot, wait one second before advancing
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.soundForValue(atIndex: index + 1, ofInput: input)
            })
        }
    }
   
    
    @IBAction func BLEEP(_ sender: Any) {
        soundForValue(atIndex: 0, ofInput: morseCode)
    }
}
