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
            lbUnit.text = "Currency"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Euro", for: .normal)
        case "Currency":
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
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
        case "Temperature":
            calcTemperature()
        case "Weight":
            calcWeight()
        case "Currency":
            calcCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Fahrenheit"
            lbResult.text = String(format: "%.2f" , temperature * 1.8 + 32.0)
        } else {
            lbResultUnit.text = "Celcius"
            lbResult.text = String(format: "%.2f", (temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Pound"
            lbResult.text = String(format: "%.2f", weight / 2.2046)
        } else {
            lbResultUnit.text = "Kilogram"
            lbResult.text = String(format: "%.2f", weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Real"
            lbResult.text = String(format: "%.2f", currency / 4.6)
        } else {
            lbResultUnit.text = "Euro"
            lbResult.text = String(format: "%.2f", currency * 4.6)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Kilometer"
            lbResult.text = String(distance * 1000.0)
        } else {
            lbResultUnit.text = "Meter"
            lbResult.text = String(distance / 1000.0)
        }
    }
}
