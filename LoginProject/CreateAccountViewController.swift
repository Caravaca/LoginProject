//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Antonio Caravaca Vega on 19/02/15.
//  Copyright (c) 2015 Antonio Caravaca Vega. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated()
}

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate: CreateAccountViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        if choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text.isEmpty != true {
            
            // NSUserDefaults stores lightweight info between sessions
            
            NSUserDefaults.standardUserDefaults().setObject(chooseUsernameTextField.text, forKey: kUsernameKey)
            NSUserDefaults.standardUserDefaults().setObject(choosePasswordTextField.text, forKey: kPasswordKey)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            dismissViewControllerAnimated(true, completion: nil)
            delegate?.accountCreated()
        }else if choosePasswordTextField.text != confirmPasswordTextField.text && choosePasswordTextField.text.isEmpty != true {
            var alertController = UIAlertController(title: "Warning", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }else if choosePasswordTextField.text.isEmpty == true || chooseUsernameTextField.text.isEmpty == true {
            var alertController = UIAlertController(title: "Warning", message: "Please enter a Username and a Password", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
