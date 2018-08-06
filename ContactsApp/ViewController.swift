//
//  ViewController.swift
//  ContactsApp
//
//  Created by Vinay Ponnuri on 8/6/18.
//  Copyright © 2018 Vinay Ponnuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "TwoLabelCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TwoLabelCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwoLabelCell", for: indexPath) as! TwoLabelCell
        cell.firstName.text = "Vianyhjbkn"
        cell.lastName.text = "Ponnuri"
        return cell
    }
    
    @IBAction func addNewContact(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "NewContact", bundle: nil)
        let navVC = storyBoard.instantiateViewController(withIdentifier: "newContact") as! NewContactViewController
        self.navigationController?.pushViewController(navVC, animated: true)
        
    }
    
}

