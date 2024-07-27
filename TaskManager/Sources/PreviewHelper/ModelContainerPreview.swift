//
//  ModelContainerPreview.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 14/07/24.
//

import SwiftUI
import SwiftData

struct ModelContainerPreview<Content: View>: View {
    var content: () -> Content
    let container: ModelContainer

    init(@ViewBuilder content: @escaping () -> Content, modelContainer: @escaping () throws -> ModelContainer) {
        self.content = content
        do {
            self.container = try MainActor.assumeIsolated(modelContainer)
        } catch {
            fatalError("Failed to create the model container: \(error.localizedDescription)")
        }
    }

    init(_ modelContainer: @escaping () throws -> ModelContainer, @ViewBuilder content: @escaping () -> Content) {
        self.init(content: content, modelContainer: modelContainer)
    }

    var body: some View {
        content()
            .modelContainer(container)
    }
}
