//
//  RecentCard.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct RecentCard: View {
    let section: CourseSection
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .foregroundColor(.white)
        .background(section.color)
        .mask(Mask())
    }
}

struct RecentCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentCard(section: courseSections[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
