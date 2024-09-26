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
    
    var taskService = TaskServiesImpl()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           tasks = taskService.listTasks()
           
           tableView.delegate = self
           tableView.dataSource = self
           tableView.reloadData()
           
           let nib = UINib(nibName: "TemporaryCell", bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: "TemporaryCell")

       }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tasks = taskService.listTasks()
        tableView.reloadData()
        print("aaaaa")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewconroller = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        let navVC = UINavigationController(rootViewController: viewconroller)
        navVC.navigationBar.backgroundColor = .systemGray5
        
        self.present(navVC, animated: true)
    }
}



