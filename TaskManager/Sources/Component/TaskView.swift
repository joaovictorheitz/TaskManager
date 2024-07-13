//
//  TaskView.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import SwiftUI

struct TaskView: View {
    @State var task: TaskModel
    
    var body: some View {
        HStack {
            VStack {
                Button(action: { task.toggleStatus() }, label: {
                    CheckBoxView(isChecked: $task.isChecked)
                })
                .padding()
            }
            
            VStack (alignment: .leading) {
                Text(task.title)
                    .font(.system(size: 15))
                    .foregroundStyle(TaskManagerAsset.Assets.titleTextColor.swiftUIColor)
                    .strikethrough(task.isChecked)
                    .padding(.bottom, 2.5)
                
                Text(task.hour.toSimpleHourMinute())
                    .font(.system(size: 13))
                    .foregroundStyle(TaskManagerAsset.Assets.timeTextColor.swiftUIColor)
                    .strikethrough(task.isChecked)
            }
            .opacity(task.isChecked ? 0.3 : 1)
            
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        let calendar = Calendar.current
        let now = Date()
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                TaskView(task: TaskModel(title: "Lavar Louça", hour: calendar.date(bySettingHour: 8, minute: 2, second: 0, of: now)!))
                Spacer()
            }
            Spacer()
        }
    }
}
