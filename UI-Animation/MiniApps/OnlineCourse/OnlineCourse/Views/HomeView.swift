//
//  HomeView.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    title
                    
                    courseVCards
                    
                    recentScetion
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var title: some View {
        Text("Courses")
            .customFont(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
    
    private var courseVCards: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(courses) { course in
                    CourseCard(course: course)
                }
            }
            .padding(20)
            .padding(.bottom, 10)
        }
    }
    
    private var recentTitle: some View {
        Text("Recent")
            .customFont(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var recentScetion: some View {
        VStack {
            recentTitle
            
            VStack(spacing: 20) {
                ForEach(courseSections) { course in
                    RecentCard(section: course)
                }
            }
        }
        .padding(20)
    }
}
