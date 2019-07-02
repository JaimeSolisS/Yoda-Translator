//
//  MyQuotesTableViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/27/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class MyQuotesTableViewController: UITableViewController, quoteDelegate {
    
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
        
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "quotes")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quotes", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.textLabel?.numberOfLines = 0
        cell.lbQuote.text = quotes[indexPath.row].quote
        cell.imYoda.image = UIImage(named: "yodaPequenio")

        return cell
    }
    
    func sendQuote(quote: Quote) {
        quotes.append(quote)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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

