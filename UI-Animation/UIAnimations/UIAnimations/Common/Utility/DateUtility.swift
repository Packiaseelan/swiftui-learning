//
//  DateUtility.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import Foundation

func getDateString(date: Date? = nil, dateFormat: String? = nil) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat  ?? "EEEE dd MMMM"
    let strDate = dateFormatter.string(from: date ?? Date())
    return strDate
}
