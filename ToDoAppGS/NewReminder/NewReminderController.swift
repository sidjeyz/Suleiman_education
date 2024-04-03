//
//  ViewController2.swift
//  ToDoAppGS
//
//  Created by Сулейман on 23.02.2024.
//

import UIKit

struct NewReminderViewModel{
    var title: String?
    var comment: String?
    var category: Category?
    var date: Date?
}
class NewReminderController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {
    
    @IBOutlet weak var tableViewNewCase: UITableView!
    
    var sections: [SectionNewReminder] = []
    private var model: NewReminderViewModel = .init()
    
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
        
        let nib5 = UINib(nibName: "DatePickerCell", bundle: nil)
        tableViewNewCase.register(nib5, forCellReuseIdentifier: "DatePickerCell")
        
        let nib6 = UINib(nibName: "TimeCell", bundle: nil)
        tableViewNewCase.register(nib6, forCellReuseIdentifier: "TimeCell")
        
        sections = [
            SectionNewReminder(items: [.title(TitleCellNewReminder(title: "")),.comm(CommCellNewReminder(comm: ""))]),
            
            SectionNewReminder(items: [.list(ListCellNewReminder(icon: UIImage(named: "Image"), list: "Список", category: "Все"))]),
            
            SectionNewReminder(items: [.doc(DocCellNewReminder(image: UIImage(named: "data"), title: "Дата", switcher: false, type: .date)),.doc(DocCellNewReminder(image: UIImage(named: "time"), title: "Время", switcher: false, type: .time))]),
            SectionNewReminder(items: [.doc(DocCellNewReminder(image: UIImage(named: "location"), title: "Местоположение", switcher: false, type: .time))])
            

        ]

    }
    
    @objc private func cancelShowNewCase(){
        self.dismiss(animated: true)
    }
    
}


protocol NewReminderDelegate: AnyObject{
    func titleTextDidChange(text: String)
    func commTextDidChange(text: String)
    func didToggleDate(_ isOn: Bool)
    func didToggleTime(_ isOn: Bool)
}

extension NewReminderController: NewReminderDelegate{
    func didToggleTime(_ isOn: Bool) {
        var timeRowIndex = 1
        if isOn {
            self.sections[2].items.insert(.time(.init(time: Date())), at: timeRowIndex + 1)
            self.tableViewNewCase.insertRows(at: [.init(row: timeRowIndex + 1, section: 2)], with: .fade)
        }
        else{
            self.sections[2].items.remove(at: timeRowIndex )
            self.tableViewNewCase.deleteRows(at: [.init(row: timeRowIndex + 1, section: 2)], with: .fade)
        }
    }
    
    func didToggleDate(_ isOn: Bool) {
        var dateRowIndex = 0
        if isOn{
            self.sections[2].items.insert(.date(.init(date: Date())), at: dateRowIndex+1)
            self.tableViewNewCase.insertRows(at: [.init(row: dateRowIndex + 1, section: 2)], with: .fade)
        }
        else{
            self.sections[2].items.remove(at: dateRowIndex)
            self.tableViewNewCase.deleteRows(at: [.init(row: dateRowIndex+1, section: 2)], with: .fade)
        }
        
        
    }
    
    func commTextDidChange(text: String) {
        self.model.comment = text
    }
    
    
    func titleTextDidChange(text: String) {
        self.model.title = text
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


