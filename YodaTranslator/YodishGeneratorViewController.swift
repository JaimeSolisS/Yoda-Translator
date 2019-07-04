//
//  YodishGeneratorViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/28/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase
import FirebaseDatabase


class YodishGeneratorViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var tvMyQuote: UITextView!
    @IBOutlet weak var tvYodishQuote: UITextView!
    
    
    var quote: Quote!
    var yodish: String!
    var quotes = [Quote]()
    var quoteStr: String!
    var user: String!
    
    //URL
//"https://api.funtranslations.com/translate/yoda.json?text=Master%20Obiwan%20has%20lost%20two%20planets."
    
    let baseURL = "https://api.funtranslations.com/translate/yoda.json?text="
    var quoteToYodish: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      //  let tabbar = tabBarController as! TabBarViewController
       // quote = tabbar.quote
       // quotes = tabbar.quotes
      
    }
    
    //Esconder teclado al tocar fuera
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func LogOut(_ sender: UIBarButtonItem) {
    /*  print("Entro")
        do {
            try Auth.auth().signOut()
            print("LogOut")
           // navigationController?.popToRootViewController(animated: true)
        } catch {
            let alerta = UIAlertController(title: "Error", message: "there was an error logging out", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alerta, animated: true, completion: nil)
            print("error: there was an error logging out")
        }*/
    }
    
    
    
    
    @IBAction func SeekAdvice(_ sender: UIButton) {
        createAlert(title: "If you are noticing yoda-errors, please note the following:", message: "You must use proper punctuation (apostrophes, full stops, commas, etc.) in order for this to work. \n\nYoda's language is like English, but with very different grammar. Not much is going to change if you just use one or two words, like 'Hello'. \n\nAlso make sure that each sentence clause is separated by punctuation; e.g. ''Hi, you're new here, aren't you?' \n\nThank you!")
    }
    
    
    func createAlert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true, completion: nil)
    }
    
    
    @IBAction func ConvertToYodish(_ sender: Any) {
        
        if tvMyQuote.text  != "" {
            
            quoteToYodish = tvMyQuote.text.replacingOccurrences(of: " ", with: "%20")
            let finalURL = baseURL + quoteToYodish
            
            
            print(finalURL)
            
            Alamofire.request(finalURL, method: .get).responseJSON { response in
                
                if response.result.isSuccess {
                    print("inicio")
                    print("Si pudo obtener los datos")
                    let convertJSON : JSON = JSON(response.result.value!)
                    print(convertJSON)
                    let amountJSON = convertJSON["contents"].dictionaryValue
                    print("amountJSON:")
                    print(amountJSON)
                    let errorAmountJSON = convertJSON["error"].dictionaryValue
                    print("amountJSON:")
                    print(errorAmountJSON)
                    
                    for (key, value) in amountJSON{
                        if key == "translated"{
                            self.yodish = value.string!
                        }
                    }
                            for (key, value) in errorAmountJSON{
                                if key == "message"{
                                    print("Entra AQUI")
                                    self.yodish = value.string!
                                }
                        }
                    
                    print("control--->")
                    print(self.yodish!)
                    self.tvYodishQuote.text = self.yodish
                    
                } else {
                    print ("no se pudo conectar")
                }
            }
            
        } else {
            let alerta = UIAlertController(title: "Error", message: "Write something, please", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta,animated: true, completion: nil)
        }
        
      
        
        
        
     
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = tvMyQuote.text
    }
    
  
    
    @IBAction func SaveQuote(_ sender: UIButton) {
        
        let tabbar = tabBarController as! TabBarViewController
        quoteStr = yodish
        user = tabbar.user
      
          let quoteDb = Database.database().reference().child("Quotes")
      
        let id = quoteDb.childByAutoId().key!
        let quoteDiccionario =
            ["id": id as String,
             "quote": quoteStr as String,
             "user": user as String] as [String: Any]
        quoteDb.child(id).setValue(quoteDiccionario)
        
        
    }
    
   
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC = segue.destination as! MyQuotesTableViewController
        tableVC.quote = quote
        tableVC.quotes.append(quote)
        tableVC.tableView.reloadData()
 
    }
 */
    
 
  
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Entro")
        do {
            try Auth.auth().signOut()
            print("LogOut")
            // navigationController?.popToRootViewController(animated: true)
        } catch {
            let alerta = UIAlertController(title: "Error", message: "there was an error logging out", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alerta, animated: true, completion: nil)
            print("error: there was an error logging out")
        }
    }
    
    
    

}
