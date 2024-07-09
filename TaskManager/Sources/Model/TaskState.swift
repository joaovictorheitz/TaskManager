//
//  TaskState.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import Foundation

enum TaskState: Int {
    case completed = 1
    case uncompleted = 0
    
    mutating func toggleStatus() {
        switch self {
        case .uncompleted:
            self = .completed
        case .completed:
            self = .uncompleted
        }
    }
}
