//
//  LocalViewBuilderBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 13/07/22.
//

import SwiftUI

struct LocalViewBuilderBootcamp: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        headerSection
    }
    
    @ViewBuilder private var headerSection: some View {
        if type == .one {
            viewOne
        } else if type == .two {
            viewTwo
        } else if type == .three {
            viewThree
        }
    }
    
    private var viewOne: some View {
        Text("One!")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("Two!!!")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        VStack {
            Image(systemName: "heart.fill")
        }
    }
}

struct LocalViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LocalViewBuilderBootcamp(type: .one)
            LocalViewBuilderBootcamp(type: .two)
            LocalViewBuilderBootcamp(type: .three)
        }
        .previewLayout(.sizeThatFits)
    }
}
