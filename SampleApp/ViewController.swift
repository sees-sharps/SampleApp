//
//  ViewController.swift
//  SampleApp
//
//  Created by Andy on 11/7/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load the default values
        lowerBoundField.text = "1"
        upperBoundField.text = "10"
        
        //set the keyboard type
        lowerBoundField.keyboardType = UIKeyboardType.numberPad
        upperBoundField.keyboardType = UIKeyboardType.numberPad
        
        //tap outside text fields clears keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard)))
    }
    
    func dismissKeyboard() {
        lowerBoundField.resignFirstResponder()
        upperBoundField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateTapped(_ sender: UIButton) {
        if let lower = UInt32(lowerBoundField.text!), let upper = UInt32(upperBoundField.text!)
        {
            let randomNum = arc4random_uniform(upper - lower) + lower
            
            resultLabel.text = "Result: \(randomNum)"
        }
    }
}

