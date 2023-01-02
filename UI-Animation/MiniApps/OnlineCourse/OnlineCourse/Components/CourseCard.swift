//
//  CourseCard.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct CourseCard: View {
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            title
            subtitle
            caption
            
            Spacer()
            
            HStack {
                ForEach(Array([4,5,6].shuffled().enumerated()), id: \.offset) { index, number in
                    buildAvatar(index: index, number: number)
                }
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(.linearGradient(colors: [course.color.opacity(1), course.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(Mask())
        .shadow(color: course.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: course.color.opacity(0.3), radius: 2, x: 0, y: 1)
        .overlay(courseIcon)
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(course: courses[1])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

extension CourseCard {
    private var title: some View {
        Text(course.title)
            .customFont(.title2)
            .frame(maxWidth: 170, alignment: .leading)
            .layoutPriority(1)
    }
    
    private var subtitle: some View {
        Text(course.subtitle)
            .opacity(0.7)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var caption: some View {
        Text(course.caption.uppercased())
            .customFont(.footnote2)
            .opacity(0.7)
    }
    
    private var courseIcon: some View {
        course.image
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
    }
    
    @ViewBuilder
    private func buildAvatar(index: Int, number: Int) -> some View {
        Image("Avatar \(number)")
            .resizable()
            .mask(Circle())
            .frame(width: 44, height: 44)
            .offset(x: CGFloat(index * -20))
    }
}
