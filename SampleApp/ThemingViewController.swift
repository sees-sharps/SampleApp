//
//  ThemingViewController.swift
//  SampleApp
//
//  Created by Andy on 11/14/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class ThemingViewController: UIViewController {

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func raiseAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Misc. Alert", message: "You pressed the alert button!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Misc. Sheet", message: "Oh sheet! Now what?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel)
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Continue", style: .default)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func stepValueChanged(_ stepper: UIStepper) {
        stepLabel.text = "Step: \(Int(stepper.value))"
    }
    
    @IBAction func themeSwitched(_ sender: UISwitch) {
        if sender.isOn
        {
            //apply the dark theme!
            stepLabel.textColor = UIColor.black
            themeLabel.textColor = UIColor.black
            self.view.backgroundColor = UIColor.black
        }
        else
        {
            //switch to light theme
            stepLabel.textColor = UIColor.white
            themeLabel.textColor = UIColor.white
            self.view.backgroundColor = UIColor.white
        }
    }
}
