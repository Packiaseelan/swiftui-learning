//
//  Action.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 13/11/22.
//

import Foundation

protocol Action {}

struct IncrementAction: Action {}

struct DecrementAction: Action {}

struct AddAction: Action {
    let value: Int
}

struct AddTaskAction: Action {
    let task: Task
}
