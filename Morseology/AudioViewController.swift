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
    func play(for resource: String, tpe: String) {
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {return}
        let sound = URL(fileURLWithPath: path)
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            assert(false, error.localizedDescription)
        }
    }
    
}
