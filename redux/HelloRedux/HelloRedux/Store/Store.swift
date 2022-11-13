//
//  Store.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 12/11/22.
//

import Foundation

typealias Dispatcher = (Action) -> ()
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> ()

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
    var middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
