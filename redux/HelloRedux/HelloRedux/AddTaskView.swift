//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 13/11/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var name: String = ""
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let tasks: [Task]
        //dispatch action
        var onTaskAdded: (Task) -> ()
    }
    
    private func map(state: TaskState) -> Props {
        Props(
            tasks: state.tasks,
            onTaskAdded: { task in
            store.dispatch(action: AddTaskAction(task: task))
        })
    }
    
    var body: some View {
        
        let props = map(state: store.state.task)
        
        VStack {
            TextField("Enter task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add Task") {
                let task = Task(title: name)
                props.onTaskAdded(task)
                name = ""
            }
            
            List(props.tasks, id: \.id) { task in
                Text(task.title)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(Store(reducer: appReducer, state: AppState()))
    }
}
