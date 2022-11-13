//
//  ContentView.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        var counter: Int
        var onIncrement: () -> ()
        var onDecrement: () -> ()
        var onAdd: (Int) -> ()
        var onIncrementAsync: () -> ()
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: {
            store.dispatch(action: AddAction(value: $0))
        }, onIncrementAsync: {
            store.dispatch(action: IncrementActionAsync())
        })
    }
    
    var body: some View {
        let props = map(state: store.state.counter)
        VStack {
            Spacer()
            Text("\(props.counter)")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(100)
            }
            Button("Increment Async") {
                props.onIncrementAsync()
            }
            Spacer()
            Button("Add Task") {
                isPresented.toggle()
            }
            Spacer()
        }
        .sheet(isPresented: $isPresented) {
            AddTaskView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store(reducer: appReducer, state: AppState()))
    }
}
