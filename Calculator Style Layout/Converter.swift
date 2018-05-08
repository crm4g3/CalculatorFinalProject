//
//  Converter.swift
//  Calculator Style Layout
//
//  Created by Cody McIlviane on 4/13/18.
//  Copyright © 2018 Cody McIlviane. All rights reserved.
//

import Foundation

class Converter{
    var inputNum: String?
    var outputNum: String?
    
    var converters: [ConversionTypes]
    var conversionType: ConversionType
    var chosenConversion: Int
    var decimalUsed: Bool
    var isNegative: Bool
    
    init(){
        self.inputNum = nil
        self.outputNum = nil
        self.conversionType = ConversionType.FtoC
        self.chosenConversion = 0
        self.decimalUsed = false
        self.isNegative = false
        
        let fToC = ConversionTypes(label:"fahrenheit to celcius",inputUnit:" °F",outputUnit:" °C");
        let cToF = ConversionTypes(label:"celcius to fahrenheit",inputUnit:" °C",outputUnit:" °F");
        let mToK = ConversionTypes(label:"miles to kilometers",inputUnit:" mi",outputUnit:" km");
        let kToM = ConversionTypes(label:"kilometers to miles",inputUnit:" km",outputUnit:" mi");
        
        converters = [fToC, cToF, mToK, kToM]
    }
    
    func updateOutput(){
        if let inputNumString = self.inputNum{
            if let inputNumDouble = Double(inputNumString){
                switch conversionType{
                case ConversionType.FtoC:
                    outputNum = String(format:"%.2f",(inputNumDouble - 32) * (5/9))
                case ConversionType.CtoF:
                    outputNum = String(format:"%.2f",(inputNumDouble * 1.8) + 32)
                case ConversionType.MtoK:
                    outputNum = String(format:"%.2f",inputNumDouble * 1.60934)
                case ConversionType.KtoM:
                    outputNum = String(format:"%.2f",inputNumDouble * 0.621371)
                }
            }
        }else{
            print("Could not unwrap inputNum")
        }
    }
}

struct ConversionTypes{
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String){
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
