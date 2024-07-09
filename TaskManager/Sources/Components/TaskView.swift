//
//  TaskView.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 08/07/24.
//

import SwiftUI

struct TaskView: View {
    @StateObject var task: TaskModel
    
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
                
                Text(task.hour)
                    .font(.system(size: 13))
                    .foregroundStyle(TaskManagerAsset.Assets.timeTextColor.swiftUIColor)
                    .strikethrough(task.isChecked)
            }
            .opacity(task.isChecked ? 0.3 : 1)
        }
    }
}

#Preview {
    ZStack {
        VStack {
            Spacer()
            HStack {
                Spacer()
                TaskView(task: TaskModel(title: "Lavar Louça", hour: "12:42"))
                Spacer()
            }
            Spacer()
        }
    }
}
