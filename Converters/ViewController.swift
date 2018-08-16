//
//  ViewController.swift
//  Converters
//
//  Created by Murillo R. Araujo on 12/06/2018.
//  Copyright © 2018 Code In Capsule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperature":
            lbUnit.text = "Weight"
            btUnit1.setTitle("Kilogram", for: .normal)
            btUnit2.setTitle("Pound", for: .normal)
        case "Weight":
            lbUnit.text = "Money"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Euro", for: .normal)
        case "Money":
            lbUnit.text = "Distance"
            btUnit1.setTitle("Meter", for: .normal)
            btUnit2.setTitle("Kilometer", for: .normal)
        default:
            lbUnit.text = "Temperature"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Fahrenheit", for: .normal)
        }
        
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
    }
}
