//
//  FavoritesTableViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/28/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseDatabase
import Firebase

class FavoritesTableViewController: UITableViewController {

    var quotes = [Quote]()
    var quote: Quote!
    var quoteStr: String!
    var user: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       /* let tabbar = tabBarController as! TabBarViewController
        quotes = tabbar.quotes
        user = tabbar.user
        */
        ReadQuotes()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "quotes")
    }
    
    func ReadQuotes() {
        SVProgressHUD.show()
        let quoteDb = Database.database().reference().child("Quotes").queryOrdered(byChild: "id")
        quoteDb.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, Any>
            let userQuote = snapshotValue["user"] as! String
            
                self.quote = Quote(id: snapshotValue["id"] as! String,
                                   quote: snapshotValue["quote"] as! String,
                                   user: userQuote)
                
                //usuario: snapshotValue["usuario"] as! String
                self.quotes.append(self.quote)
                self.quotes.reverse()
                self.tableView.reloadData()
        }
        SVProgressHUD.dismiss()
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
