//
//  TodayView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct TodayView: View {
    
    @EnvironmentObject var vm: TodayViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                header
                
                ForEach(vm.items, id: \.id) {
                    TodayItemView(item: $0)
                }.coordinateSpace(name: "forEach")
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .environmentObject(TodayViewModel())
    }
}

extension TodayView {
    private var header: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(vm.date)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        .padding(.top)
        .padding(.horizontal)
    }
}
