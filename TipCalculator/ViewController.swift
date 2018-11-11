//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tiffany Pan on 11/10/18.
//  Copyright © 2018 Tiffany Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentages: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Tip Calculator"
        
        if let bill = defaults.string(forKey: "bill") {
            billField.text = bill
        }
        tipPercentages.selectedSegmentIndex = defaults.integer(forKey: "index")
        calculate()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func caculateTip(_ sender: Any) {
        calculate()
    }
    func calculate() {
        let tipValues = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        if bill != 0 { defaults.set(billField.text!, forKey: "bill") }
        
        let tip = bill * tipValues[tipPercentages.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

