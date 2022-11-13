//
//  UITestingBootcampViewModel.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/10/22.
//

import Foundation

class UITestingBootcampViewModel: ObservableObject {
    let placeholderText: String = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var currentUserIsSignedIn: Bool
    
    init(currentUserIsSignedIn: Bool) {
        self.currentUserIsSignedIn = currentUserIsSignedIn
    }
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
}
