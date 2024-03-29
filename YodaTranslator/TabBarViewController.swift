//
//  TabBarViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 7/2/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class TabBarViewController: UITabBarController {
    
    var quotes = [Quote]()
    var quoteStr: String!
    var user: String!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        user = Auth.auth().currentUser?.email
        
        
        // self.navigationController!.topViewController!.navigationItem.title = "Sign Out"
        
       /* let backItem = UIBarButtonItem()
        backItem.title = "Regresa"
        navigationItem.backBarButtonItem = backItem */
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Desconectar(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            let alerta = UIAlertController(title: "Error", message: "there was an error logging out", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alerta, animated: true, completion: nil)
            print("error: there was an error logging out")
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
