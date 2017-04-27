//
//  TrainingVC.swift
//  Plants
//
//  Created by Saska Rauhala on 21.4.2017.
//  Copyright © 2017 SarTekh. All rights reserved.
//

import UIKit

class TrainingVC: UIViewController {
    
    @IBOutlet weak var categoryField: UINavigationItem!
    
    var category: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryField.title = category

    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "goMain", sender: self)

    }

    @IBAction func startPressed(_ sender: Any) {
        callAlert(title: "Ready", message: "")
    }
    
    func callAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "YES", style: .default, handler: { (alert) in
            self.performSegue(withIdentifier: "goToPlay", sender: self.category!)
            })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
            })
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let destination = segue.destination as? PlayVC {
            if let category = sender as? String {
                destination.category = category
            }
        }
        
        
    }
    
}
