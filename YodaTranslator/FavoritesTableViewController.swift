//
//  FavoritesTableViewController.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/28/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var quotes = [Quote]()
    var quote: Quote!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quote = Quote(quote: "Come here to chew bubble gum and kick ***, have I. And all out of bubble gum, I am.")
        quotes.append(quote)
        quote = Quote(quote: "Barbie girl, am I, in the barbie world. Life in plastic, fantastic, it is fantastic! Brush my hair, you can, me everywhere undress. Imagination, your creation, life is. Come on barbie, go party, let us! Yeesssssss.")
        quotes.append(quote)
        quote = Quote(quote: "The yoda therapist, I am. To get in touch with your inner yoda, speak like yoda for a day, you must. Then be in touch with your inner yoda, you will. 150 bucks, that will be. Yes, hmmm.")
        quotes.append(quote)
        quote = Quote(quote: "If you feel an intense burning feeling, sharp stinging pain, you may be getting sliced in half. Common side effect of yoda, this is. Your jedi master right away consult. Herh herh herh.")
        quotes.append(quote)
        quote = Quote(quote: "Impossible, this next test is, to solve it make no attempt.")
        quotes.append(quote)
        quote = Quote(quote: "Charging the entire clone army with identity theft, I heard that jango fett was.")
        quotes.append(quote)
        quote = Quote(quote: "If big butts you like not, then get fit, you must!")
        quotes.append(quote)
        quote = Quote(quote: "If to learn the speakings of yoda you try, seen too much star wars, you have. Herh herh herh.")
        quotes.append(quote)
        quote = Quote(quote: "Woodchuck chuck, how much wood could, if chuck wood, a woodchuck could, hmm? Yes, hmmm.")
        quotes.append(quote)
        quote = Quote(quote: "You may say, a dreamer, am I; But I am the only one not; I hope some day, join us, you will; And live as one, the world will. Yes, hmmm.")
        quotes.append(quote)
        quote = Quote(quote: "Got to ask yourself one question, you have. Feel lucky, do I, hmm? Well, do you, punk, hmm?")
        quotes.append(quote)
        quote = Quote(quote: "To be, or to be not. The question, that is. Hmmmmmm.")
        quotes.append(quote)
        quote = Quote(quote: "What the h**l, talking about, are you?")
        quotes.append(quote)
        quote = Quote(quote: "I cannot believe it is butter not!")
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
