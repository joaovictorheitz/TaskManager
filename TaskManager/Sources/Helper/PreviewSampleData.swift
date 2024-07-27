//
//  PreviewSampleData.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 27/07/24.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: TaskModel.self, 
                                           configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        return container
    } catch {
        fatalError(error.localizedDescription)
    }
}()
