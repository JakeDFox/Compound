//
//  CompoundCalc.swift
//  Compound
//
//  Created by Jacob Fox on 2017-12-16.
//  Copyright © 2017 Jacob Fox. All rights reserved.
//

import Foundation

class CompoundCalc {
    private var _digitone: String = "%"
    private var _digittwo: String = "0"
    private var _digitthree: String = "0"
    private var _digitfour: String = ""
    private var _digitfive: String = "0"
    private var _digitsix: String = "0"
    private var _percent: String = "0.0000"
    
    private var _result: Double = 0.00
    private var _percentDouble: Double = 0.00
    private var _multiplier: Double = 12.00
    private var _initialbalance: Double = 0.00
    private var _years: Double = 0.00
    private var _payments: Double = 0.00
    
    var digitone: String {
        get {
            return _digitone
        }
    }
    
    var digittwo: String {
        get {
            return _digittwo
        }
    }
    
    var digitthree: String {
        get {
            return _digitthree
        }
    }
    
    var digitfour: String {
        get {
            return _digitfour
        }
    }
    
    var digitfive: String {
        get {
            return _digitfive
        }
    }
    
    var digitsix: String {
        get {
            return _digitsix
        }
    }
    
    var percent: String {
        get {
            return _percent
        }
    }
    
    var result: Double {
        get {
            return _result
        }
    }
    
    var percentDouble: Double {
        get {
            return _percentDouble
        }
    }
    
    var multiplier: Double {
        get {
            return _multiplier
        }
    }
    
    var initialbalance: Double {
        get {
            return _initialbalance
        }
    }
    
    var years: Double {
        get {
            return _years
        }
    }
    
    var payments: Double {
        get {
            return _payments
        }
    }
    
    func calculateWithPercent() {
        _result = initialbalance * pow((1 + percentDouble / multiplier), (multiplier * years)) + payments * (pow((1 + percentDouble / multiplier), (multiplier * years)) - 1) * (multiplier / percentDouble)
    }
    
    func calculateWithoutPercent() {
        _result = initialbalance + payments * years

    }
    
}
