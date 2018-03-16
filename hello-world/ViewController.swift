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
    
    @IBOutlet weak var imgOutput: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func tfName_Change(_ sender: Any) {
    }
    
    @IBAction func btnGo_Click(_ sender: Any) {
    
        
            
        tvOutput.isHidden = false
        // Sample 4000/310
        do
        {
            
             let dict = try german_lookup(registrationNumber: tfName.text!,  username:"xxxxx", password:"lokiju")
            
            tvOutput.text = dict["Description"] as? String
            let strImageUrl = dict["ImageUrl"] as? String
            imgOutput.downloadedFrom(link: strImageUrl!)
            
        }
        catch
        {
            tvOutput.text = "Sorry, not recognised";
            
            let alertController = UIAlertController(title: "Sorry", message: "Code Not recognised :(", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alertController.addAction(cancelAction)

            self.present(alertController, animated: true, completion: nil)
        }
    }
       
}
    


