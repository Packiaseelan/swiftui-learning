//
//  PreferenceKeyBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 13/07/22.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State var title: String = ""
    
    var body: some View {
        VStack {
            Text(title)
            SecondaryView()
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            title = value
        }
    }
}

struct PreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}

struct SecondaryView: View {
    
    @State private var newValue: String = ""
    
    var body: some View {
        Text("This is secondary view")
            .onAppear(perform: downloading)
            .customTitle(newValue)
    }
    
    private func downloading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "new value for title from secondary view"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func customTitle(_ title: String ) -> some View{
        preference(key: CustomTitlePreferenceKey.self, value: title)
    }
}
