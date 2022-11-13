//
//  SignedInHomeView.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/10/22.
//

import SwiftUI

struct SignedInHomeView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show welcome alert")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .accessibilityIdentifier("ShowAlertButton")
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Welcome to the app!"))
                }
                
                
                NavigationLink(destination: Text("Destination"), label: {
                    Text("Navigate")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .accessibilityIdentifier("NavigateLinkToDestination")
                
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

struct SignedInHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SignedInHomeView()
    }
}
