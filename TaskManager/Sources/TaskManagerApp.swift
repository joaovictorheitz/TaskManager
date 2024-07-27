import SwiftUI
import SwiftData

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            let calendar = Calendar.current
            let now = Date()

//            @State var viewModel = TaskListViewModel()
            
            ListTaskView()
                .modelContainer(for: TaskModel.self)
        }
    }
}
