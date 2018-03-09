//
//  ViewController.swift
//  hello-world
//
//  Created by user909680 on 3/9/18.
//  Copyright © 2018 user909680. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tvOutput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnGo_Click(_ sender: Any) {
        tvOutput.isHidden = false
        tvOutput.text = hiThere() + tfName.text!
        
    }
    
}

