//
//  ViewController.swift
//  Morseology
//
//  Created by its on 24/7/2017.
//  Copyright © 2017 Nerds In A Room. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            //Dictionary
            if identifier == "displayDictionary" {
                print ("Going to Dictionary")
                //Actually showing dictionary
                let dictionaryViewController = segue.destination as! DictionaryViewController
            } else {
                //Torch
                if identifier == "displayTorch" {
                    print ("Going to torch")
                    let torchViewController = segue.destination as! TorchViewController
                } else {
                    //Audio
                    if identifier == "displayAudio" {
                        print ("Going to audio")
                        let audioViewController = segue.destination as! AudioViewController
                    }
                }
            }
        }
    }
    

}

