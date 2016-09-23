//
//  MVVM_DEMOTests.swift
//  MVVM-DEMOTests
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import XCTest
import RealmSwift
@testable import MVVM_DEMO

class MVVM_DEMOTests: XCTestCase {
    
    var userCommentHelper = UserCommentHelper()
    
    override func setUp() {
        super.setUp()
        
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testconvertEmailToLowerCase ()
    {
        let email = userCommentHelper.convertEmailToLowerCase("Saketpandhare@yahoo.com")
        XCTAssert(email == "saketpandhare@yahoo.com")
    }
    
    func testproperUserName()
    {
        let name = userCommentHelper.properUserName("saket pramod pandhare anuradha")
        XCTAssert(name == "saket pramod pandhare ...")
    }
    
}
