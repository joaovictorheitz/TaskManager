//
//  HideCompletedTasksButtonView.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 09/07/24.
//

import SwiftUI

struct HideCompletedTasksButtonView: View {
    @Binding var shouldHideDoneTasks: Bool
    
    var body: some View {
        Button(action: { shouldHideDoneTasks.toggle() }, label: {
            Text(shouldHideDoneTasks ? TaskManagerStrings.showDoneTasks : TaskManagerStrings.hideDoneTasks)
                .font(.system(size: 13))
                .fontWeight(.medium)
        })
    }
}
