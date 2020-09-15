//
//  ViewController.swift
//  tip
//
//  Created by Mary on 9/11/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!

    
    override func viewDidLoad() {
       super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tipPercentageLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
       
        
    }

    var isFirstLayout: Bool = true
    override func viewDidAppear(_ animated: Bool) {
        // Show Keyboard by Default
        super.viewDidLayoutSubviews()
        if isFirstLayout {
            defer { isFirstLayout = false }
        billAmountTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tip
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
         tipPercentageLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
}

