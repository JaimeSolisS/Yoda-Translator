//
//  YodishGeneratorViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/28/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

protocol quoteDelegate {
    func sendQuote (quote: Quote)
}



class YodishGeneratorViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var tvMyQuote: UITextView!
    @IBOutlet weak var tvYodishQuote: UITextView!
    
    var delegate: quoteDelegate?
    
    var quote: Quote!
    var yodish: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tvMyQuote.delegate = self
      
    }
    
    //Esconder teclado al tocar fuera
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
         yodish = tvMyQuote.text
        tvYodishQuote.text = yodish
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = tvMyQuote.text
    }
    
  
    
    @IBAction func SaveQuote(_ sender: UIButton) {
        //print(tvYodishQuote.text!)
        quote = Quote(quote: yodish)
        print(quote.quote)
        delegate?.sendQuote(quote: quote)
         self.navigationController?.popViewController(animated: true)
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC = segue.destination as! MyQuotesTableViewController
        tableVC.quote = quote
        tableVC.quotes.append(quote)
        tableVC.tableView.reloadData()
 
    }
 */
    
 
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
