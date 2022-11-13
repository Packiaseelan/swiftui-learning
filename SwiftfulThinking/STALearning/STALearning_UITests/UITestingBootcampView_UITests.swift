//
//  UITestingBootcampView_UITests.swift
//  STALearning_UITests
//
//  Created by Packiaseelan S on 26/10/22.
//

// Naming Structure: test_[Struct]_[ui components]_[expected result]
// Naming Structure: test_[variable or function]_[expected result] // this file has only test cases for one struct or class
// Testing Structure: Given, When, Then

import XCTest

final class UITestingBootcampView_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
//        app.launchArguments = ["-UITexst_startSignedIn"]
//        app.launchEnvironment = ["-UITexst_startSignedIn2": "true"]
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_UITestingBootcampView_signUpButton_ShowldNotSignIn() {
        // Given
        signUpAndSignIn(shouldTypeInKeyboard: false)
        
        // When
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_ShowldSignIn() {
        // Given
        signUpAndSignIn(shouldTypeInKeyboard: true)
        
        // When
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlert_shouldDisplayAlert() {
        // Given
        signUpAndSignIn(shouldTypeInKeyboard: true)
        
        // When
        tapAlertButton(shouldDismiss: false)

        // Then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }
    
    func test_SignedInHomeView_showAlert_shouldDisplayAndDismissAlert() {
        // Given
        signUpAndSignIn(shouldTypeInKeyboard: true)
        
        // When
        tapAlertButton(shouldDismiss: true)
        
        // Then
        let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
        XCTAssertFalse(alertExists)
    }
    
    func test_SignedInHomeView_navigateLinkToDestination_shouldNavigateToDestination() {
        // Given
        signUpAndSignIn(shouldTypeInKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: false)
        
        // Then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_SignedInHomeView_navigateLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // Given
        signUpAndSignIn(shouldTypeInKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: true)
        
        // Then
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SignedInHomeView_navigateLinkToDestination_shouldNavigateToDestinationAndGoBack2() {
        // Given
//        signUpAndSignIn(shouldTypeInKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: true)
        
        // Then
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
    }
}

// MARK: FUNCTIONS
extension UITestingBootcampView_UITests {
    
    func signUpAndSignIn(shouldTypeInKeyboard: Bool) {
        let textField = app.textFields["SignUpTextField"]
        textField.tap()
        
        if shouldTypeInKeyboard {
            app.keys["A"].tap()
            app.keys["b"].tap()
            app.keys["c"].tap()
        }
        app.buttons["Return"].tap()
        app.buttons["SignUpButton"].tap()
    }
    
    func tapAlertButton (shouldDismiss: Bool) {
        let alertButton = app.buttons["ShowAlertButton"]
        alertButton.tap()
        
        if shouldDismiss {
            let alert = app.alerts.firstMatch
            
            let alertOkButton = alert.buttons["OK"]
            let alertOkButtonExist = alertOkButton.waitForExistence(timeout: 5)
            XCTAssertTrue(alertOkButtonExist)
            
            alertOkButton.tap()
        }
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        let navLink = app.buttons["NavigateLinkToDestination"]
        navLink.tap()
        
        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome"]
            backButton.tap()
        }
    }
    
}
