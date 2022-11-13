//
//  ViewBuilderBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 13/07/22.
//

import SwiftUI

struct HeaderViewRegular: View {
    let title: String
    let description: String?
    let imageName: String?
    
    init(title: String, description: String? = nil, imageName: String? = nil) {
        self.title = title
        self.description = description
        self.imageName = imageName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let imageName = imageName {
                Image(systemName: imageName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        
        .padding()
    }
}

struct HeaderViewGeneric<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, content: Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        
        .padding()
    }
}

struct HeaderViewGeneric1<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        
        .padding()
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        ScrollView {
            VStack {
                HeaderViewRegular(title: "Title")
                
                HeaderViewRegular(title: "Title 1", description: "title with description")
                
                HeaderViewRegular(title: "Title 2", description: "title with description and image", imageName: "heart.fill")
                
                HeaderViewRegular(title: "Title 3", imageName: "heart.fill")
                
                HeaderViewGeneric(title: "Generic Title ", content: Text("Hello"))
                
                HeaderViewGeneric(title: "Generic Title 1", content: Image(systemName: "heart"))
                
                HeaderViewGeneric(title: "Generic Title 2", content: Image(systemName: "heart"))
                
                HeaderViewGeneric1(title: "Generic Title 3") {
                    Text("Generic view with viewbuilder")
                }
                
                HeaderViewGeneric1(title: "Generic Title 4") {
                    HStack {
                        Text("Hello")
                        Image("heart")
                        Text("Hello")
                    }
                }
                
                
                Spacer()
            }
        }
    }
}

struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderBootcamp()
    }
}
