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
    
    @IBOutlet weak var AudioController: UIView!
    func play(for resource: String, type: String) {
        guard let path = Bundle.main.path(forResource: resource, ofType: "wav") else {return}
        let sound = URL(fileURLWithPath: path)
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            assert(false, error.localizedDescription)
        }
    }
    var player : AVAudioPlayer?
    
    //Making the beep
    func playShortBeep(){
        let path = Bundle.main.path(forResource: "beep", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
    
    func playLongBeep(){
        let path = Bundle.main.path(forResource: "Long beep", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
    
    // Beeping out the Morse
    /*
    func morseBeeps() {
        for character in morseTextField.text {
            if character == "." {
                playShortBeep()
            } else {
                if character == "-" {
                    playLongBeep()
                } else {
                    //leave a gap
                }
            }
        }
    }
    */
}
