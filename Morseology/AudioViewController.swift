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
    
    var morseCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    /*
    //Linking to audio files
    @IBOutlet weak var AudioController: UIView!
    func play(for resource: String, type: String) {
        guard let path = Bundle.main.path(forResource: resource, ofType: "mp3") else {return}
        let sound = URL(fileURLWithPath: path)
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            assert(false, error.localizedDescription)
        }
    }*/
    
    /*Trying something out
    private func toggleSound() {
        guard let device = AVAudioPlayer(withMediaType: AVMediaTypeAudio) else {return}
        do {
            try device.lockForConfiguration()
            
        }
    }
 */
    
    /*
    var player : AVAudioPlayer?
    
    //Making the beep
    func playShortBeep(){
        let path = Bundle.main.path(forResource: "shortBeep", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
            print ("short beep")
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
    //Making the beep
    func playLongBeep(){
        let path = Bundle.main.path(forResource: "longerBeep", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
            print ("long beep")
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
    
    func playPause(){
        let path = Bundle.main.path(forResource: "space", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
            print ("pause")
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }
 
 */
    
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
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
   
    /*
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let morseTextField = homeScreenViewController.MorseTextField.text?.uppercased() {
            for character in morseTextField.characters {
                if character == "." {
                    
                    Sound.play(file: "shortBeep")
                    print ("short")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        Sound.stop(file: "shortBeep.mp3")
                        print ("stop")
                    })
                } else if character == "-" {
                    Sound.play(file: "longerBeep")
                    print ("long")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15, execute: {
                        Sound.stopAll()
                        print ("stop")
                    })
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        print ("pause")
                    })
                }
            }
        }
    }*/
    
    // Beeping out the Morse
    //OH time the pauses not the sounds
   
    @IBAction func BLEEP(_ sender: Any) {
        soundForValue(atIndex: 0, ofInput: morseCode)
    }
}
