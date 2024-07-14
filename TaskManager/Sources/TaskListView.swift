import SwiftUI
import Foundation

public struct ListTaskView: View {
    @StateObject var viewModel: TaskListViewModel
        
    init(_ viewModel: TaskListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    ForEach(viewModel.taskDictionary.keys.sorted(), id: \.self) { date in                        
                        HStack {
                            DayLabelView(date.toSimpleDate())
                            
                            Spacer()
                            
                            if shouldShowHideButton(date) {
                                VStack {
                                    Spacer()
                                    
                                    HideCompletedTasksButtonView(shouldHideDoneTasks: $viewModel.shouldHideDoneTasks)
                                }
                            }
                        }
                        .padding()
                        
                        ForEach(viewModel.taskDictionary[date] ?? [], id: \.id) { task in
                            TaskView(task: task)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .background(TaskManagerAsset.Assets.backgroundColor.swiftUIColor)
    }
    
    func shouldShowHideButton(_ date: Date) -> Bool {
        return date == viewModel.taskDictionary.keys.sorted().first
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar.current
        let now = Date()

        let tasks = [
            TaskModel(title: "Task 1", hour: calendar.date(bySettingHour: 6, minute: 11, second: 0, of: now.addingTimeInterval(-30*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 2", hour: calendar.date(bySettingHour: 19, minute: 12, second: 0, of: now.addingTimeInterval(12*24*60*60))!, status: .completed),
            TaskModel(title: "Task 3", hour: calendar.date(bySettingHour: 13, minute: 38, second: 0, of: now.addingTimeInterval(21*24*60*60))!, status: .completed),
            TaskModel(title: "Task 4", hour: calendar.date(bySettingHour: 20, minute: 26, second: 0, of: now.addingTimeInterval(26*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 5", hour: calendar.date(bySettingHour: 11, minute: 48, second: 0, of: now.addingTimeInterval(-2*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 6", hour: calendar.date(bySettingHour: 12, minute: 9, second: 0, of: now.addingTimeInterval(9*24*60*60))!, status: .completed),
            TaskModel(title: "Task 7", hour: calendar.date(bySettingHour: 9, minute: 44, second: 0, of: now.addingTimeInterval(11*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 8", hour: calendar.date(bySettingHour: 23, minute: 8, second: 0, of: now.addingTimeInterval(5*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 9", hour: calendar.date(bySettingHour: 17, minute: 27, second: 0, of: now.addingTimeInterval(-29*24*60*60))!, status: .completed),
            TaskModel(title: "Task 10", hour: calendar.date(bySettingHour: 14, minute: 55, second: 0, of: now.addingTimeInterval(15*24*60*60))!, status: .completed),
            TaskModel(title: "Task 11", hour: calendar.date(bySettingHour: 21, minute: 1, second: 0, of: now.addingTimeInterval(-6*24*60*60))!, status: .completed),
            TaskModel(title: "Task 12", hour: calendar.date(bySettingHour: 7, minute: 50, second: 0, of: now.addingTimeInterval(16*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 13", hour: calendar.date(bySettingHour: 11, minute: 5, second: 0, of: now.addingTimeInterval(1*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 14", hour: calendar.date(bySettingHour: 22, minute: 30, second: 0, of: now.addingTimeInterval(23*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 15", hour: calendar.date(bySettingHour: 14, minute: 4, second: 0, of: now.addingTimeInterval(30*24*60*60))!, status: .completed),
            TaskModel(title: "Task 16", hour: calendar.date(bySettingHour: 21, minute: 1, second: 0, of: now.addingTimeInterval(-6*24*60*60))!, status: .completed),
            TaskModel(title: "Task 17", hour: calendar.date(bySettingHour: 3, minute: 46, second: 0, of: now.addingTimeInterval(-29*24*60*60))!, status: .completed),
            TaskModel(title: "Task 18", hour: calendar.date(bySettingHour: 5, minute: 13, second: 0, of: now.addingTimeInterval(29*24*60*60))!, status: .uncompleted),
            TaskModel(title: "Task 19", hour: calendar.date(bySettingHour: 8, minute: 10, second: 0, of: now.addingTimeInterval(21*24*60*60))!, status: .completed),
            TaskModel(title: "Task 20", hour: calendar.date(bySettingHour: 11, minute: 12, second: 0, of: now.addingTimeInterval(13*24*60*60))!, status: .completed)
        ]
        
        @State var viewModel = TaskListViewModel(tasks: tasks)
        
        ListTaskView(viewModel)
    }
}
