//
//  DateUtility.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import Foundation

extension Date {
    func getStringFormat(dateFormat: String? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat  ?? "EEEE dd MMMM"
        let strDate = dateFormatter.string(from: self)
        return strDate
    }
}
