//
//  TaskModel.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import Foundation

class TaskModel: ObservableObject, Identifiable {
    var id = UUID()
    
    var title: String
    var hour: Date
    var status: TaskState
    @Published var isChecked: Bool
    
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
