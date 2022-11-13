//
//  IncrementMiddleware.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 13/11/22.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as IncrementActionAsync:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                dispatch(IncrementActionAsync())
            }
        default:
            break
        }
    }
}
