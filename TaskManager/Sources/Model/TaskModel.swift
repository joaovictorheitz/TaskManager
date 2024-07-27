//
//  TaskModel.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import Foundation
import SwiftData

@Model
final class TaskModel: Identifiable {
    @Attribute(.unique) var id = UUID()
    
    var title: String
    var hour: Date
    var status: TaskState
    var isChecked: Bool
    
    init(title: String, hour: Date, status: TaskState = .uncompleted) {
        self.title = title
        self.hour = hour
        self.status = status
        self.isChecked = status.rawValue != 0
    }
    
    func toggleStatus() {
        self.status.toggleStatus()
        self.isChecked = self.status.rawValue != 0
    }
}

extension [TaskModel] {
    func orderedList() -> [TaskModel] {
        return self.sorted(by: { $0.hour.compare($1.hour) == .orderedAscending})
    }
    
    func orderedDictionary() -> [Date : [TaskModel]] {
        var tasksByDate: [Date: [TaskModel]] = [:]
        
        for task in self {
            let taskDate = Calendar.current.startOfDay(for: task.hour)
            
            if tasksByDate[taskDate] == nil {
                tasksByDate[taskDate] = [task]
            } else {
                tasksByDate[taskDate]?.append(task)
            }
        }
        
        return tasksByDate
    }
}
