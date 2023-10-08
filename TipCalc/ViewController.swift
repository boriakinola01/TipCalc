//
//  ViewController.swift
//  TipCalc
//
//  Created by Bori Akinola on 24/09/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var customTipPercentLabel1: UILabel!
    @IBOutlet weak var customTipPercentLabel2: UILabel!
    @IBOutlet weak var customTipPercentageSlider: UISlider!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var total15Label: UILabel!
    @IBOutlet weak var tipCustomLabel: UILabel!
    @IBOutlet weak var totalCustomLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    let tip15Percent: Float = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        overrideUserInterfaceStyle = .light
        // This shows the numeric keypad as the first thing when the app loads
        inputTextField.becomeFirstResponder()
        calculateTip(customTipPercentageSlider as Any)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let customPercent = customTipPercentageSlider.value.rounded() / 100
        
        if sender is UISlider {
            customTipPercentLabel1.text = customPercent.formatAsPercentage()
            customTipPercentLabel2.text = customTipPercentLabel1.text
        }
        
        if let inputString = inputTextField.text, !inputString.isEmpty {
            let billAmount = Float(inputString)!
            
            if sender is UITextField {
                billAmountLabel.text = " " + billAmount.formatAsCurrency()
                let fifteenTip = billAmount * tip15Percent
                tip15Label.text = fifteenTip.formatAsCurrency()
                total15Label.text = (billAmount + fifteenTip).formatAsCurrency()
            }
            let customTip = billAmount * customPercent
            tipCustomLabel.text = customTip.formatAsCurrency()
            totalCustomLabel.text = (billAmount + customTip).formatAsCurrency()
        } else {
            billAmountLabel.text = ""
            tip15Label.text = ""
            total15Label.text = ""
            tipCustomLabel.text = ""
            totalCustomLabel.text = ""
        }
    }
    
}

extension Float {
    func formatAsCurrency() -> String {
        return NumberFormatter.localizedString(from: NSNumber(value: self), number: NumberFormatter.Style.currency)
    }
    
    func formatAsPercentage() -> String {
        return NumberFormatter.localizedString(from: NSNumber(value: self), number: NumberFormatter.Style.percent)
    }
}

