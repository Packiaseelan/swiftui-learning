//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 12/11/22.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.counter = counterReducer(state.counter, action)
    state.task = taskReducer(state.task, action)
    return state
}
