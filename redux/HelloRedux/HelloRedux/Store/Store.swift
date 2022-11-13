//
//  Store.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 12/11/22.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

protocol ReduxState { }

struct AppState: ReduxState {
    var counter = CounterState()
    var task = TaskState()
}

struct CounterState: ReduxState {
    var counter: Int = 0
}

struct TaskState: ReduxState {
    var tasks: [Task] = []
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
