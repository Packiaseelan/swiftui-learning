//
//  DetailGridView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 22/06/22.
//

import SwiftUI

struct DetailGridView: View {
    
    let title: String?
    let stats: [StatisticModel]
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30.0
    
    init(title: String? = nil, stats: [StatisticModel]) {
        self.title = title
        self.stats = stats
    }
    
    var body: some View {
        VStack {
            if title != nil {
                titleView
                Divider()
            }
            
            gridView
        }
    }
}

struct DetailGridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailGridView(stats: [
                dev.stat1, dev.stat2, dev.stat3
            ])
            
            DetailGridView(title: "Additional Information", stats: [
                dev.stat1, dev.stat2, dev.stat3
            ])
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

extension DetailGridView {
    
    private var titleView: some View {
        Text(title ?? "")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var gridView: some View {
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: spacing,
                  pinnedViews: []) {
            ForEach(stats) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
}
