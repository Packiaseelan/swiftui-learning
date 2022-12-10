//
//  TodayViewModel.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

class TodayViewModel: ObservableObject {
    
    let itemHeight:CGFloat = 430
    let imageHeight:CGFloat = 400
    let SVWidth = UIScreen.main.bounds.width - 40
    let date = Date().getStringFormat()
    
    @Published var items: [TodayModel] = []
    @Published var selectedItem: TodayModel?
    @Published var showDetails: Bool = false
    @Published var detailsWillHide: Bool = false
    @Published var detailsStartPoint: CGRect = CGRect.zero
    @Published var detailsReturnPoint: CGRect = CGRect.zero
    
    init() {
        fetchItems()
    }
    
    private func fetchItems() {
        items = todayItems
    }
}
