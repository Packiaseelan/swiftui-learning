//
//  DetailGridView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 22/06/22.
//

import SwiftUI

struct DetailGridView: View {
    
    @State var showFullDescription: Bool = false
    
    private let title: String
    private let stats: [StatisticModel]
    private let description: String?
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30.0
    
    init(title: String, description: String? = nil, stats: [StatisticModel]) {
        self.title = title
        self.stats = stats
        self.description = description
    }
    
    var body: some View {
        VStack {
            titleView
            Divider()
            descriptionSection
            gridView
        }
    }
}

struct DetailGridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailGridView(title: "Overview", stats: [
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
        Text(title)
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
    
    private var descriptionSection: some View {
        ZStack {
            if let description = description,
               !description.isEmpty {
                VStack(alignment: .leading) {
                    Text(description)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                        .lineLimit(showFullDescription ? nil : 3)
                    
                    Button(action: onReadMore) {
                        Text(showFullDescription ? "Less" : "Read more...")
                            .font(.caption)
                            .bold()
                            .padding(.vertical, 4)
                    }
                    .accentColor(.blue)
                }
            }
        }
        .animation(.none, value: description)
    }
    
    private func onReadMore() {
        withAnimation(.easeInOut) {
            showFullDescription.toggle()
        }
    }
    
}
