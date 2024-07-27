//
//  TaskListViewModel.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 10/07/24.
//

import Foundation
import SwiftUI
import SwiftData

public class TaskListViewModel: ObservableObject {
    @Published var shouldHideDoneTasks: Bool = false
    @Published var taskDictionary: [Date : [TaskModel]] = [:]
    
    private let clearTasksBeforeToday: Bool = true
    
    init(shouldHideDoneTasks: Bool = false) {
        self.shouldHideDoneTasks = shouldHideDoneTasks
    }
    
    func updateViewModelList(_ tasks: [TaskModel]) {
        if !clearTasksBeforeToday {
            self.taskDictionary = tasks.orderedList().orderedDictionary()
        } else {
            self.taskDictionary = tasks.filter { task in return task.hour > Calendar.current.startOfDay(for: Date()) }.orderedList().orderedDictionary()
        }
    }
}
