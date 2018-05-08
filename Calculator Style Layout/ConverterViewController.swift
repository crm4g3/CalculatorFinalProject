//
//  ConverterViewController.swift
//  Calculator Style Layout
//
//  Created by Cody McIlviane on 4/13/18.
//  Copyright © 2018 Cody McIlviane. All rights reserved.
//

import Foundation
import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converter: Converter = Converter()
    
    @IBAction func ConverterButtonPressed(_ sender: Any) {
        let popUpAction = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        popUpAction.addAction(UIAlertAction(title: converter.converters[0].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            self.converter.conversionType = ConversionType.FtoC
            self.converter.chosenConversion = 0
            self.update()
        }))
        
        popUpAction.addAction(UIAlertAction(title: converter.converters[1].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in

            self.converter.conversionType = ConversionType.CtoF
            self.converter.chosenConversion = 1
            self.update()
        }))
        
        popUpAction.addAction(UIAlertAction(title: converter.converters[2].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            self.converter.conversionType = ConversionType.MtoK
            self.converter.chosenConversion = 2
            self.update()
        }))
        
        popUpAction.addAction(UIAlertAction(title: converter.converters[3].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            self.converter.conversionType = ConversionType.KtoM
            self.converter.chosenConversion = 3
            self.update()
        }))
        
        
        self.present(popUpAction, animated: true, completion: nil)
    }
    
    func update(choice: Int, outputText: String?, inputText: String?){
        
    }
    
    func update(){
        if let inputText = converter.inputNum{
            self.inputDisplay.text = inputText + self.converter.converters[converter.chosenConversion].inputUnit
        }else{
            self.inputDisplay.text = self.converter.converters[converter.chosenConversion].inputUnit
        }
        
        UpdateOutput()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.outputDisplay.text = self.converter.converters[converter.chosenConversion].outputUnit
        self.inputDisplay.text = self.converter.converters[converter.chosenConversion].inputUnit
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateOutput(){
        converter.updateOutput()
        if let newOutput = converter.outputNum{
            self.outputDisplay.text = newOutput + self.converter.converters[converter.chosenConversion].outputUnit
        }else{
            self.outputDisplay.text = self.converter.converters[converter.chosenConversion].outputUnit
        }
    }
    
    @IBAction func NumButtonPressed(_ sender: Any) {
        let numButton: UIButton = sender as! UIButton
        let pickedNum: String = (numButton.titleLabel?.text)!
        
        if let newInputText = converter.inputNum{
            self.inputDisplay.text = newInputText + pickedNum + self.converter.converters[converter.chosenConversion].inputUnit
            converter.inputNum = newInputText + pickedNum
        }else{
            self.inputDisplay.text = pickedNum + self.converter.converters[converter.chosenConversion].inputUnit
            converter.inputNum = pickedNum
        }
        
        UpdateOutput()
    }
    @IBAction func DecimalButtonPressed(_ sender: Any) {
        if !converter.decimalUsed{
            converter.decimalUsed = true
            var temp = ""
            if let inputText = converter.inputNum{
                temp = inputText + "."
            }else{
                temp = "0."
            }
            converter.inputNum = temp
            self.inputDisplay.text = temp + converter.converters[converter.chosenConversion].inputUnit
            UpdateOutput()
        }
    }
    @IBAction func ClearButtonPressed(_ sender: Any) {
        converter = Converter()
        
        self.outputDisplay.text = self.converter.converters[converter.chosenConversion].outputUnit
        self.inputDisplay.text = self.converter.converters[converter.chosenConversion].inputUnit
    }
    @IBAction func NegativePositiveButtonPressed(_ sender: Any) {
        
        if !converter.isNegative{
            var temp = ""
            if let inputText = converter.inputNum{
                converter.isNegative = true
                temp = "-"+inputText
                converter.inputNum = temp
                self.inputDisplay.text = temp + converter.converters[converter.chosenConversion].inputUnit
                UpdateOutput()
            }
        }else{
            if var inputText = converter.inputNum{
                converter.isNegative = false
                if let i = inputText.index(of: "-") {
                    inputText.remove(at: i)
                }
                converter.inputNum = inputText
                self.inputDisplay.text = inputText + converter.converters[converter.chosenConversion].inputUnit
                UpdateOutput()
            }
        }
    }
    
}
