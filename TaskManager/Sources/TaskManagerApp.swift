import SwiftUI
import SwiftData

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ListTaskView()
                .modelContainer(for: TaskModel.self)
        }
    }
}
