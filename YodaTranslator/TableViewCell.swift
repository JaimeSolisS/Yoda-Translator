//
//  TableViewCell.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/27/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imYoda: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
