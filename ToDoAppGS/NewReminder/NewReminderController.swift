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
    var time: Date?
    
    func getTask() -> Task? {
        guard let title, let comment, let category, let date else {return nil}
        return Task(title: title,
                     isDone: false,
                     creationDate: Date(),
                     date: date,
                     comm: comment
        )
    }
}

class NewReminderController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {
    
    let addButton = UIBarButtonItem(title: "Добавить", style: .done, target: self, action: #selector(addNewReminder))
    
    @IBOutlet weak var tableViewNewCase: UITableView!
    
    var sections: [SectionNewReminder] = []
    
    private var model: NewReminderViewModel = NewReminderViewModel(){
        didSet {
            checkField()
        }
    }
    
    
    init(){
        print("я создался")
        super.init(nibName: nil, bundle: nil)
        print(Unmanaged.passUnretained(self).toOpaque())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("я создался")
        print(Unmanaged.passUnretained(self).toOpaque())
    }
    
    deinit{
        print("я умер")
        print(Unmanaged.passUnretained(self).toOpaque())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cancelButton = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(cancelShowNewCase))
        self.navigationItem.rightBarButtonItem = addButton
        addButton.isEnabled = false
        self.navigationItem.leftBarButtonItem = cancelButton
        self.title = "Новое дело"
        checkField()
        
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
    
    func checkField() {
        addButton.isEnabled = model.title != nil && model.date != nil
    }
    
    @objc func addNewReminder() {
        let task = Task(title: model.title, date: model.date, time: model.time, comm: model.comment)
            do {
                try TaskServiesImpl().save(task: task)
                dismiss(animated: true, completion: nil)
            } catch {
                print("Ошибка при сохранении задания: \(error.localizedDescription)")
            }
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
    func dateDidChange(date: Date)
    func timeDidChange(time: Date)
}

extension NewReminderController: NewReminderDelegate{
    func dateDidChange(date: Date) {
        self.model.date = date
    }
    
    func timeDidChange(time: Date) {
        self.model.time = time
    }
    
    func didToggleTime(_ isOn: Bool) {
        var timeRowIndex = 1
        if isOn && self.sections[2].items.count == 3{
            self.sections[2].items.insert(.time(.init(time: Date())), at: timeRowIndex + 2)
            self.tableViewNewCase.insertRows(at: [.init(row: timeRowIndex + 2, section: 2)], with: .fade)
            
        }
        
        else if isOn == false && self.sections[2].items.count == 4{
            self.sections[2].items.remove(at: timeRowIndex + 1)
            self.tableViewNewCase.deleteRows(at: [.init(row: timeRowIndex + 2, section: 2)], with: .fade)
        }
        
        if isOn && self.sections[2].items.count == 2{
                self.sections[2].items.insert(.time(.init(time: Date())), at: timeRowIndex + 1)
                self.tableViewNewCase.insertRows(at: [.init(row: timeRowIndex + 1, section: 2)], with: .fade)
        }
        else if isOn == false && self.sections[2].items.count == 3{
            self.sections[2].items.remove(at: timeRowIndex + 1)
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
            self.tableViewNewCase.deleteRows(at: [.init(row: dateRowIndex + 1, section: 2)], with: .fade)
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


