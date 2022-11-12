//
//  ContentView.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    struct Props {
        var counter: Int
        var onIncrement: () -> ()
        var onDecrement: () -> ()
        var onAdd: (Int) -> ()
    }
    
    private func map(state: State) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: {
            store.dispatch(action: AddAction(value: $0))
        })
    }
    
    var body: some View {
        let props = map(state: store.state)
        VStack {
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store(reducer: reducer))
    }
}
