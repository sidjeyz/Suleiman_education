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
    
    var loadingView: LoadingView!
    
    var taskService = TaskServiesImpl()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           loadingView = Bundle.main.loadNibNamed("LoadingView", owner: nil, options: nil)![0] as? LoadingView
           loadingView.translatesAutoresizingMaskIntoConstraints = false
           

           loadingView.setText("Загружаем ваш список дел")
           
           self.view.addSubview(loadingView)
           
           NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            loadingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24)
           ])
           
           #warning("Задание домой: Нужно после 2-х секунд скрыть лоадер и показать табличку")
           
           tableView.isHidden = true
           
           tasks = taskService.listTasks()
           
           tableView.delegate = self
           tableView.dataSource = self
           //tableView.reloadData()
           
           let nib = UINib(nibName: "TemporaryCell", bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: "TemporaryCell")

       }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //tasks = taskService.listTasks()
        //tableView.reloadData()
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



