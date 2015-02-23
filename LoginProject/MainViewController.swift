//
//  MainViewController.swift
//  LoginProject
//
//  Created by Antonio Caravaca Vega on 19/02/15.
//  Copyright (c) 2015 Antonio Caravaca Vega. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let savedUsername = NSUserDefaults.standardUserDefaults().objectForKey(kUsernameKey) as String
        let savedPasword = NSUserDefaults.standardUserDefaults().objectForKey(kPasswordKey) as String
        usernameLabel.text = savedUsername
        passwordLabel.text = savedPasword
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
