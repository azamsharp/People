//
//  Extensions.swift
//  PeopleUITests
//
//  Created by Mohammad Azam on 12/1/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    
    func tapAndType(text :String) {
        tap()
        typeText(text)
    }
    
    func tapAndClear() {
        tap()
        typeText("")
    }
    
}
