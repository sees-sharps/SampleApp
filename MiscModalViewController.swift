//
//  MiscModalViewController.swift
//  SampleApp
//
//  Created by Andy on 11/19/16.
//  Copyright © 2016 Arclite Technologies. All rights reserved.
//

import UIKit

class MiscModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismissModal(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
