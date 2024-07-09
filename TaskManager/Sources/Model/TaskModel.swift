//
//  TaskModel.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import Foundation

class TaskModel: ObservableObject {
    var title: String
    var hour: String
    var status: TaskState
    @Published var isChecked: Bool
    
    init(title: String, hour: String, status: TaskState = .uncompleted) {
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
