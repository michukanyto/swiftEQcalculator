//
//  ViewController.swift
//  calculator
//
//  Created by Marlon Escobar on 2019-03-06.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var eqText: UITextField!
    @IBOutlet weak var resultText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eqText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eqText.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let toParse = eqText.text;
        //parse toParse
        
        let result = makeOperation(equation: toParse!)
        resultText.text = result
    }
    
    func makeOperation(equation : String) ->String{
        let expn = NSExpression(format:equation)
        let result:Int = expn.expressionValue(with: nil, context: nil) as! Int
        let newString = String(result)
        return newString
    }


}

