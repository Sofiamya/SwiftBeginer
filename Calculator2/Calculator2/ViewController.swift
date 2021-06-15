//
//  ViewController.swift
//  Calculator2
//
//  Created by Сергей Злобин on 15.06.2021.
//  Copyright © 2021 karpova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLable: UILabel!
     
    var stillTyping = false
    var dotIsPlase = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    
    var currentInput: Double {
        get {
            return Double(displayResultLable.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLable.text = "\(valueArray[0])"
            } else {
                  displayResultLable.text = "\(newValue)"
            }
           
         stillTyping = false
        }
    }

    @IBAction func namberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if stillTyping {
            if displayResultLable.text!.count < 20 {
                displayResultLable.text = displayResultLable.text! + number
            }
        } else {
            displayResultLable.text = number
            stillTyping = true
        }
        
        
    }
 
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping =  false
        dotIsPlase = false
    }
    
    func operateWithTwoOperand(operation:(Double, Double)->Double)  {
        currentInput = operation (firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func eqalitySignPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        dotIsPlase = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperand{$0 + $1}
        case "-":
             operateWithTwoOperand{$0 - $1}
        case "×":
             operateWithTwoOperand{$0 * $1}
        case "÷":
            if secondOperand == 0  {
                          displayResultLable.text = "Нельзя делить на ноль"
                      }
            else {
             operateWithTwoOperand{$0 / $1}
            }
            
        default: break
        }
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLable.text = "0"
        stillTyping = false
        operationSign = ""
        dotIsPlase = false
    }
    
    
    @IBAction func plusMinusBattonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func persentageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
    }
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping  && !dotIsPlase {
            displayResultLable.text = displayResultLable.text! + "."
            dotIsPlase = true
        } else if !stillTyping && !dotIsPlase {
            displayResultLable.text = "0."
        }
    }
}

