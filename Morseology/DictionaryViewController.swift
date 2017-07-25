//
//  DictionaryViewController.swift
//  Morseology
//
//  Created by its on 24/7/2017.
//  Copyright © 2017 Nerds In A Room. All rights reserved.
//

import Foundation
import UIKit

class DictionaryViewController: UIViewController {
    @IBOutlet weak var englishTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewController
    }
    
}
