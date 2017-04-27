//
//  RoundedButton.swift
//  Plants
//
//  Created by Saska Rauhala on 26.4.2017.
//  Copyright © 2017 SarTekh. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 3.0
    }
}
