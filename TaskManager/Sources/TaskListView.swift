import SwiftUI
import SwiftData
import Foundation

public struct ListTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var tasks: [TaskModel]
    
    @StateObject var viewModel: TaskListViewModel
    
    @State private var isShowingSheet = false
    @State private var text = ""
    @State private var dateSelected = Date()
        
    init() {
        self._viewModel = StateObject(wrappedValue: TaskListViewModel())
    }
    
    public var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
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
                                if shouldShowTask(task: task) {
                                    TaskView(task: task)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                    }
                }
                
                Button(action: { isShowingSheet.toggle() }, label: {
                    Circle()
                        .frame(width: 42, height: 42)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.white)
                                .frame(width: 17.68, height: 17.68)
                        }
                })
                .tint(.black)
                .padding(30)
            }
            .background(TaskManagerAsset.Assets.backgroundColor.swiftUIColor)
            .sheet(isPresented: $isShowingSheet, content: {
                NavigationStack {
                    AddTaskSheetView(text: $text, 
                                     dateSelected: $dateSelected,
                                     isShowingSheet: $isShowingSheet,
                                     completion: saveAndUpdate)
                }
            })
        }
        .background(TaskManagerAsset.Assets.backgroundColor.swiftUIColor)
        .onAppear {
            viewModel.updateViewModelList(tasks)
        }
    }
    
    func shouldShowHideButton(_ date: Date) -> Bool {
        return date == viewModel.taskDictionary.keys.sorted().first
    }
    
    func saveAndUpdate() {
        modelContext.insert(TaskModel(title: text, hour: dateSelected))
        viewModel.updateViewModelList(tasks)
    }
    
    func shouldShowTask(task: TaskModel) -> Bool {
        return viewModel.shouldHideDoneTasks ? !task.isChecked : true
    }
}

#Preview {
    ListTaskView()
        .modelContainer(previewContainer)
}
