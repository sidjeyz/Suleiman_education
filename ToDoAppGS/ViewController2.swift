//
//  ViewController2.swift
//  ToDoAppGS
//
//  Created by Сулейман on 23.02.2024.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {

    
    @IBOutlet weak var tableViewNewCase: UITableView!
    var secs: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButton = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(cancelShowNewCase))
        self.navigationItem.leftBarButtonItem = barButton
        self.title = "Новое дело"
        
        
        tableViewNewCase.dataSource = self
        tableViewNewCase.delegate = self
        
        let nib = UINib(nibName: "ListCell", bundle: nil)
        tableViewNewCase.register(nib, forCellReuseIdentifier: "ListCell")
        
        let nib2 = UINib(nibName: "TitleCell", bundle: nil)
        tableViewNewCase.register(nib2, forCellReuseIdentifier: "TitleCell")
        
        let nib3 = UINib(nibName: "CommCell", bundle: nil)
        tableViewNewCase.register(nib3, forCellReuseIdentifier: "CommCell")
        
        let nib4 = UINib(nibName: "DocCell", bundle: nil)
        tableViewNewCase.register(nib4, forCellReuseIdentifier: "DocCell")
        
        secs = [
            Section(items: [.title(TitleCells(title: "")),.comm(CommCells(comm: ""))]),
            
            Section(items: [.list(ListCells(icon: UIImage(named: "Image"), list: "Список", category: "Все"))]),
            
            Section(items: [.doc(DocCells(image: UIImage(named: "data"), title: "Дата", switcher: true)),.doc(DocCells(image: UIImage(named: "time"), title: "Время", switcher: true))]),
            
            Section(items: [.doc(DocCells(image: UIImage(named: "location"), title: "Местоположние", switcher: true))])
            ]
        }
    
    @objc private func cancelShowNewCase(){
        self.dismiss(animated: true)
    }
    
    
}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


