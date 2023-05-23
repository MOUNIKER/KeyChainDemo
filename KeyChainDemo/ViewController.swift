//
//  ViewController.swift
//  KeyChainDemo
//
//  Created by Siva Mouniker  on 18/05/23.
//

import UIKit
import KeychainAccess
class ViewController: UIViewController {

    
    @IBOutlet weak var FirstNameLbl: UITextField!
    
    @IBOutlet weak var LastNameLbl: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load keychain data
        let keychain = Keychain(service: "com.Msil.KeyChainDemo")
        FirstNameLbl.text = keychain["Text-1"]
        //Load usedefaults
        
        
        let data = UserDefaults.standard.object(forKey: "Text-2")
        if data != nil{
            self.LastNameLbl.text = data as? String
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func SaveBtnnAction(_ sender: Any) {
        let firstNameData = FirstNameLbl.text
        let lastNameData = LastNameLbl.text
        
        //save data in keychain
        let keychain = Keychain(service: "com.Msil.KeyChainDemo")
        keychain["Text-1"] = firstNameData
        
        //save data in nsUserDafault
        UserDefaults.standard.set(lastNameData, forKey: "Text-2")
        
        
    }
    
}

