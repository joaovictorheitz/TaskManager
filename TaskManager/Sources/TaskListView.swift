import SwiftUI

public struct ListTaskView: View {
    var tasks: [TaskModel]
    @State var shouldHideDoneTasks: Bool = false

    public var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        DayLabelView(TaskManagerStrings.todayLabel)
                        
                        Spacer()
                        
                        VStack {
                            Spacer()
                            
                            HideCompletedTasksButtonView(shouldHideDoneTasks: $shouldHideDoneTasks)
                        }
                    }
                    .padding()
                }
                .frame(height: 80)
                
                ScrollView {
                    ForEach(tasks) { task in
                        if task.isChecked && shouldHideDoneTasks {
                            EmptyView()
                        } else {
                            TaskView(task: task)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .background(TaskManagerAsset.Assets.backgroundColor.swiftUIColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar.current
        let now = Date()

        let tasks = [
            TaskModel(title: "Complete project report", hour: calendar.date(bySettingHour: 17, minute: 45, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Attend team meeting", hour: calendar.date(bySettingHour: 8, minute: 0, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Review client proposal", hour: calendar.date(bySettingHour: 12, minute: 30, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Prepare presentation slides", hour: calendar.date(bySettingHour: 8, minute: 0, second: 0, of: now)!, status: .completed),
            TaskModel(title: "Conduct market research", hour: calendar.date(bySettingHour: 14, minute: 45, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Update website content", hour: calendar.date(bySettingHour: 10, minute: 45, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Plan marketing strategy", hour: calendar.date(bySettingHour: 11, minute: 0, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Organize office files", hour: calendar.date(bySettingHour: 11, minute: 45, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Schedule appointments", hour: calendar.date(bySettingHour: 10, minute: 30, second: 0, of: now)!, status: .uncompleted),
            TaskModel(title: "Write blog post", hour: calendar.date(bySettingHour: 14, minute: 15, second: 0, of: now)!, status: .completed)
        ]
        
        ListTaskView(tasks: tasks)
    }
}
