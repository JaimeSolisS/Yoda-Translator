//
//  Quote.swift
//  YodaTranslator
//
//  Created by Jaime Solís on 6/27/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
     var id: String
    var quote: String
    var user: String
   
  
    
    init(id: String, quote: String, user: String){
    
    self.id = id
     self.quote = quote
     self.user = user 

    }

}
