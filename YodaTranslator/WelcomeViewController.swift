//
//  WelcomeViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/26/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import FirebaseAuth


class WelcomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toTabBar", sender: self)
        }
          self.tfUser.delegate = self
        self.tfPassword.delegate=self

        // Do any additional setup after loading the view.
    }
    
    //Esconder teclado al tocar fuera
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presionar tecla Intro
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    
        return (true)
    }
    
    @IBAction func LoginUser(_ sender: UIButton) {
       SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: tfUser.text!, password: tfPassword.text!) { (AuthDataResult, error) in
            if error != nil {
                print("Error in Login: \(error!) ")
                let alerta = UIAlertController(title: "Error", message: "Error in Login: \(error!) ", preferredStyle: .alert)
                
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alerta, animated: true, completion: nil)
                SVProgressHUD.dismiss()
            } else {
                print("Log in successful!")
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
