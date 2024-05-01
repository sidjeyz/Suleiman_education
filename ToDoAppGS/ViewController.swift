//
//  ViewController.swift
//  ToDoAppGS
//
//  Created by guseyn on 28.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tasks = TaskServiesImpl().listTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        //let  nib = UINib(nibName: "TaskCell", bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TasksService")
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewconroller = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        let navVC = UINavigationController(rootViewController: viewconroller)
        navVC.navigationBar.backgroundColor = .systemGray5
        
    self.present(navVC, animated: true)
    }
}



