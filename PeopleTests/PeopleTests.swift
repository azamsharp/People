//
//  PeopleTests.swift
//  PeopleTests
//
//  Created by Mohammad Azam on 12/1/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import People

class When_Trying_To_Create_User : XCTestCase {
    
    func test_should_create_user_successfully() {
        
        let user = User(username: "johndoe", password: "password")
        XCTAssertNotNil(user)
    }
}


class When_Trying_To_Save_User : XCTestCase {
    
    private var dataAccess :DataAccess!
    
    override func setUp() {
        super.setUp()
        
        self.dataAccess = DataAccess()
    }
    
    func test_removing_users() {
        self.dataAccess.removeUsers()
        XCTAssertTrue(self.dataAccess.getUsers().count == 0)
    }
    
    func test_foo() {
        XCTAssertTrue(self.dataAccess.getUsers().count > 0) 
    }
    
    func test_should_save_user_successfully() {
        
        let user = User(username :"johndoe", password: "password")
        _ = self.dataAccess.saveUser(user)
        
        XCTAssertTrue(self.dataAccess.getUsers().count == 1)
    }
    
    override func tearDown() {
        super.tearDown()
        self.dataAccess.removeUsers()
    }
}

class When_Trying_To_Fetch_Users: XCTestCase {
    
    private var dataAccess :DataAccess!
    
    override func setUp() {
        super.setUp()
        
        self.dataAccess = DataAccess()
        // insert user to the database!
    }
    
    func test_should_fetch_users_successfully() {
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

}
