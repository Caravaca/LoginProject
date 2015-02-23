//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Antonio Caravaca Vega on 19/02/15.
//  Copyright (c) 2015 Antonio Caravaca Vega. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, CreateAccountViewControllerDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginToCreateAccountSegue" {
            var createAccountVC = segue.destinationViewController as CreateAccountViewController
            createAccountVC.delegate = self
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        if userAlreadyExist() == true {
            let usernameSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kUsernameKey) as String
            let passwordSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPasswordKey) as String
            
            if usernameTextField.text == usernameSavedFromNSUserDefaults && passwordTextField.text == passwordSavedFromNSUserDefaults {
                performSegueWithIdentifier("loginToMainSegue", sender: self)
            }else {
                var alertController = UIAlertController(title: "Warning", message: "Username or Pasword do not match the login information", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }else {
            var alertController = UIAlertController(title: "Warning", message: "Please create an account first", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
    }
    
    //MARK: - Create Account Delegate
    
    func accountCreated() {
        performSegueWithIdentifier("loginToMainSegue", sender: nil)
    }
    
    //MARK: - Login Helper function
    
    func userAlreadyExist() -> Bool {
        if (NSUserDefaults.standardUserDefaults().objectForKey(kUsernameKey) != nil) {
            return true
        }else {
            return false
        }
    }
    
}
