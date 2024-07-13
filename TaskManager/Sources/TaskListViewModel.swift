//
//  TaskListViewModel.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 10/07/24.
//

import Foundation
import SwiftUI

public class TaskListViewModel: ObservableObject {
    @Published var shouldHideDoneTasks: Bool = false
    @Published var tasksDictionary: [Date : [TaskModel]]
    
    private var tasks: [TaskModel]
    
    init(shouldHideDoneTasks: Bool = false, tasks: [TaskModel]) {
        self.shouldHideDoneTasks = shouldHideDoneTasks
        self.tasks = tasks
        self.tasksDictionary = tasks.orderedList().orderedDictionary()
    }
}
