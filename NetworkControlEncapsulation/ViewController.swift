//
//  ViewController.swift
//  NetworkControlEncapsulation
//
//  Created by Appinventiv on 3/20/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getButtonAction(_ sender: UIButton) {
        let parameters = [["name":nameTextField.text!],["id":idTextField.text!],["company":companyTextField.text!],["location":locationTextField.text!]]
        APIController.signup(parameters: parameters, success: { (data) in
            print(data.id)
            print(data.name)
            print(data.company)
            print(data.location)
        }) { (error) in
            print(error)
        }
    }

}

