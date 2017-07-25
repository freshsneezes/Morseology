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

class AudioViewController: UIViewController{
    var beep: AVAudioPlayer!
    
    let path = Bundle.main.path(forResource: "beep.wav", ofType: nil)!
    let url = URL(fileURLWithPath: <#T##String#>)
    
    do {
        let sound = try AVAudioPlayer(contentsOf: url)
        shortBeep = sound
        sound.play()
    } catch {
        print ("Couldn't load file")
    }
    
    /* To stop sound: 
    if shortBeep )= nil {
        shortBeep.stop()
        shortBeep = nil
    }
    
}
