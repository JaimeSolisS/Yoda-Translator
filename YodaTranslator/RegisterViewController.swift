//
//  RegisterViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 7/2/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tfUser.delegate = self
        self.tfPassword.delegate=self

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presionar tecla Intro
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return (true)
    }

    @IBAction func RegisterUser(_ sender: UIButton) {
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: tfUser.text!, password: tfPassword.text!) {
            (user, error) in
            
            if error != nil {
                print(error!)
                let alerta = UIAlertController(title: "Error", message: "Login error: \(error!) ", preferredStyle: .alert)
                
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alerta, animated: true, completion: nil)
                SVProgressHUD.dismiss()
            } else {
                //Success
                print("Registration complete")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "toTabBar", sender: self)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
