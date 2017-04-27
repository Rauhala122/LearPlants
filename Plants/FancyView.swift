//
//  FancyView.swift
//  Plants
//
//  Created by Saska Rauhala on 23.4.2017.
//  Copyright © 2017 SarTekh. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }
}
