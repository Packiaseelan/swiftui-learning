//
//  LogMiddlewares.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 13/11/22.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        print("LOG MIDDLEWARE")
    }
}
