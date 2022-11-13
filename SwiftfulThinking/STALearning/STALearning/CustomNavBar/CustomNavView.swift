//
//  CustomNavView.swift
//  STALearning
//
//  Created by Packiaseelan S on 21/08/22.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            Color.purple.ignoresSafeArea()
        }
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
         super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}
