//
//  ViewController.swift
//  Compound
//
//  Created by Jacob Fox on 2017-12-01.
//  Copyright © 2017 Jacob Fox. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            updatePercent()
    }
    
    func calculateWithPercent() {
        result = initialbalance * pow((1 + percentDouble / multiplier), (multiplier * years)) + payments * (pow((1 + percentDouble / multiplier), (multiplier * years)) - 1) * (multiplier / percentDouble)
        
    }
    
    func calculateWithoutPercent() {
        result = initialbalance + payments * years
    }
    
    var digitone = ""
    var digittwo = "0"
    var digitthree = "0"
    var digitfour = ""
    var digitfive = "0"
    var digitsix = "0"
    var percent = "0.0000"

    var result = 0.00
    var percentDouble = 0.00
    var multiplier =  12.00
    var initialbalance = 0.00
    var years = 0.00
    var payments = 0.00

    let pickerData = [["%"],["0","1","2","3","4","5","6","7","8","9"],["0","1","2","3","4","5","6","7","8","9"],["."],["0","1","2","3","4","5","6","7","8","9"],["0","1","2","3","4","5","6","7","8","9"]]

    
    @IBOutlet weak var percentPicker: UIPickerView!
    
    @IBOutlet weak var InitialBalance: UITextField!

    @IBOutlet weak var Payments: UITextField!

    @IBOutlet weak var Result: UILabel!

    @IBOutlet weak var Years: UITextField!
    
    @IBOutlet weak var monthlyYearly: UISegmentedControl!
    
    @IBAction func multiplierChanged(_ sender: UISegmentedControl) {
        
            switch monthlyYearly.selectedSegmentIndex
            
            {
            case 0:
                multiplier = 12;
            case 1:
                multiplier = 1;
            default:
                break;
            }
    }

    @IBAction func calculate(_ sender: Any) {
            if InitialBalance.text != nil && InitialBalance.text != ""
                && Payments.text != nil && Payments.text != ""
                    && Years.text != nil && Years.text != ""
            {
                if percent != nil && percent != "" && percent != "0.0000" {
        initialbalance = Double(InitialBalance.text!)!
        payments = Double(Payments.text!)!
        years = Double(Years.text!)!
        percentDouble = Double(percent)!
        
                    calculateWithPercent()
                
            }
                else {
                    calculateWithoutPercent()
                }
        let formatter = NumberFormatter()
                formatter.locale = Locale.current
                formatter.numberStyle = .currency
        if let formattedresult = formatter.string(from: result as NSNumber) {
                Result.text = "\(formattedresult)"
            
            }
        }
    }
    
    func updatePercent() {
        digitone = pickerData[0][percentPicker.selectedRow(inComponent: 0)]
        digittwo = pickerData[1][percentPicker.selectedRow(inComponent: 1)]
        digitthree = pickerData[2][percentPicker.selectedRow(inComponent: 2)]
        digitfour = pickerData[3][percentPicker.selectedRow(inComponent: 3)]
        digitfive = pickerData[4][percentPicker.selectedRow(inComponent: 4)]
        digitsix = pickerData[5][percentPicker.selectedRow(inComponent: 5)]

        percent = "0." + digittwo + digitthree + digitfive + digitsix
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentPicker.dataSource = self
        percentPicker.delegate = self
        percentPicker.showsSelectionIndicator = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    
}

