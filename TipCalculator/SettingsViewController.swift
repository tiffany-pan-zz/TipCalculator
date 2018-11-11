//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Tiffany Pan on 11/10/18.
//  Copyright © 2018 Tiffany Pan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var tipPercentages: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipPercentages.selectedSegmentIndex = defaults.integer(forKey: "index")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDefaultTipAmount(_ sender: Any) {
        defaults.set(tipPercentages.selectedSegmentIndex, forKey: "index")
        defaults.synchronize()
    }
    
}
