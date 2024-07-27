//
//  AddTaskSheetView.swift
//  TaskManager
//
//  Created by João Victor de Souza Guedes on 27/07/24.
//

import SwiftUI
import SwiftData

struct AddTaskSheetView: View {
    @Binding var text: String
    @Binding var dateSelected: Date
    @Binding var isShowingSheet: Bool
    
    var completion: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Text(TaskManagerStrings.addATask)
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                
                HStack {
                    Text(TaskManagerStrings.title)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.trailing, 60)
                    
                    TextField("", text: $text)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Text(TaskManagerStrings.hour)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    DatePicker(selection: $dateSelected, label: {EmptyView()})
                }
                .padding(.bottom, 100)
                
                Button(action: {
                    completion()
                    
                    isShowingSheet.toggle()
                }, label: {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 47)
                        .tint(.black)
                        .overlay {
                            Text(TaskManagerStrings.save)
                                .tint(.white)
                        }
                })
                
                Spacer()
            }
            .padding(20)
            
        }
    }
}

#Preview {
    AddTaskSheetView(text: .constant(""), dateSelected: .constant(Date()), isShowingSheet: .constant(true), completion: {})
}
