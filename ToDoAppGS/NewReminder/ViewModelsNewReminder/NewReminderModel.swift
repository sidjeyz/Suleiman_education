//
//  NewReminderModel.swift
//  ToDoAppGS
//
//  Created by Сулейман on 13.03.2024.
//

import Foundation
import UIKit

struct SectionNewReminder{
    var items: [CellNewReminder]
}

struct DocCellNewReminder {
    let image: UIImage?
    let title: String
    let switcher: Bool
    let type: DocCell.CellType
}

struct CommCellNewReminder{
    let comm: String
}

struct TitleCellNewReminder{
    let title: String
}

struct ListCellNewReminder{
    let icon: UIImage?
    let list: String
    let category: String
}

struct DatePickerNewReminder{
    let date: Date
}
struct TimeCellNewReminder{
    let time: Date
}
enum CellNewReminder{
    case doc(DocCellNewReminder)
    case comm(CommCellNewReminder)
    case title(TitleCellNewReminder)
    case list(ListCellNewReminder)
    case date(DatePickerNewReminder)
    case time(TimeCellNewReminder)
}
