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
    var quote: Quote!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        quote = Quote(quote: "Testing to see whether this is a bunch of rubbish or not, I am.")
        quotes.append(quote)
        quote = Quote(quote: "To be gone it is soon. Yeesssssss.")
        quotes.append(quote)
        quote = Quote(quote: "She is coming back not, cowboy.")
        quotes.append(quote)
        quote = Quote(quote: "The end, this is.  Herh herh herh.")
        quotes.append(quote)
        quote = Quote(quote: "Worthless piece of bantha fodder, this yoda converter is. Yeesssssss.")
        quotes.append(quote)
        quote = Quote(quote: "Beset on all sides by the inequities of the selfish and the tyranny of evil men, the path of the righteous man is.  Blessed who is he, of charity and good will in the name, of the darkness shepherds the weak through the valley. For truly his brother's keeper and the finder of lost children, is he. And strike down upon thee with great vengeance and furious anger those who attempt to poison and destroy my brothers, will I. And you will know, the lord, am I WHEN I lay my vengeance upon you.")
        quotes.append(quote)
        
        // self.navigationController!.topViewController!.navigationItem.title = "Sign Out"
        
       /* let backItem = UIBarButtonItem()
        backItem.title = "Regresa"
        navigationItem.backBarButtonItem = backItem */
        
        self.navigationController!.topViewController?.navigationItem.leftBarButtonItem?.title = "sign out"

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
