//
//  Preview+ModelContainer.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 14/07/24.
//

import Foundation
import SwiftData

extension ModelContainer {
    static var sample: () throws -> ModelContainer = {
        let schema = Schema([TaskModel.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [configuration])
        Task { 
            await container.mainContext.insert(TaskModel(title: "Teste", hour: Date()))
        }
        return container
    }
}
