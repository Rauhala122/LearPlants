//
//  CategoryCell.swift
//  Plants
//
//  Created by Saska Rauhala on 21.4.2017.
//  Copyright © 2017 SarTekh. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var nameFIeld: UILabel!
 
    func configureCell(name: String) {
        nameFIeld.text = name
    }
    
}
