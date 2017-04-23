//
//  ViewController.swift
//  Plants
//
//  Created by Saska Rauhala on 21.4.2017.
//  Copyright © 2017 SarTekh. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var categorys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        categorys = ["Kasvit", "Sammalet ja jäkälät", "Sienet", "Linnut", "Nisäkkäät"]
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "namesCell", for: indexPath) as? CategoryCell {
            
            cell.configureCell(name: categorys[indexPath.row])
            
            return cell
            
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categorys[indexPath.row]
        
        self.performSegue(withIdentifier: "trainingVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TrainingVC {
            if let category = sender as? String {
                destination.category = category
            }
        }
    }

}

