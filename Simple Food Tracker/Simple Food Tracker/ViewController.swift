//
//  ViewController.swift
//  Simple Food Tracker
//
//  Created by Jing Wei Nicholas Lim on 3/25/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var originField: UILabel!
    @IBOutlet weak var priceField: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var originText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func resetDefault(_ sender: UIButton) {
        nameField.text = "Name?"
        originField.text = "Origin?"
        priceField.text = "Price?"
    }
    
    @IBAction func updateButt(_ sender: UIButton) {
        nameField.text = nameText.text
        originField.text = originText.text
        priceField.text = priceText.text
    }
}

