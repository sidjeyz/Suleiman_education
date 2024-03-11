//
//  ViewController.swift
//  ToDoAppGS
//
//  Created by guseyn on 28.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        tableView.delegate = self
        tableView.dataSource = self
        let  nib = UINib(nibName: "CategoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CategoryCell")
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewconroller = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        let navVC = UINavigationController(rootViewController: viewconroller)
        navVC.navigationBar.backgroundColor = .systemGray5
        
    self.present(navVC, animated: true)
    }
}



