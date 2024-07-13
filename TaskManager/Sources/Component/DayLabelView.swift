//
//  DayLabelView.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 09/07/24.
//

import SwiftUI

struct DayLabelView: View {
    var label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    var body: some View {
        Text(label)
            .font(.system(size: 34))
            .fontWeight(.bold)
    }
}

#Preview {
    DayLabelView(TaskManagerStrings.todayLabel)
}
