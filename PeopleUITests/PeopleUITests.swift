//
//  PeopleUITests.swift
//  PeopleUITests
//
//  Created by Mohammad Azam on 12/1/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import People

class When_User_Is_Registering_For_A_New_Account: XCTestCase {
    
    private var app :XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        self.app = XCUIApplication()
        self.app.launchArguments = ["UI-Testing"]
        self.app.launch()
    }
    
    func test_should_start_app_with_registration_view() {
        
        XCTAssertEqual("Registration", app.navigationBars.element.identifier)
    }
    
    func test_should_display_error_message_if_username_already_taken() {
        
        app.textFields["usernameTextField"].tapAndType(text: "johndoe")
        app.textFields["passwordTextField"].tapAndType(text: "password")
        
        app.buttons["registerButton"].tap() // writes a user default value to users
        
        // go back to the registration page
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        // clear the fields
        app.textFields["usernameTextField"].tapAndClear()
        app.textFields["passwordTextField"].tapAndClear()
        
        app.buttons["registerButton"].tap()
        
        XCTAssertEqual("User name is already taken",app.staticTexts["messageLabel"].label)
    }
    
    func test_should_create_account_successfully() {
        
        app.textFields["usernameTextField"].tapAndType(text: "johndoe")
        app.textFields["passwordTextField"].tapAndType(text: "password")
        
        app.buttons["registerButton"].tap() // writes a user default value to users
        
        // go to the login screen if the login is successfull
        XCTAssertEqual("Login", app.navigationBars.element.identifier)
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        //self.dataAccess.removeUsers()
    }
    
    
}
