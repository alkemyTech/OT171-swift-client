//
//  SomosMasAppTests.swift
//  SomosMasAppTests
//
//  Created by Maximiliano Ituarte on 21/04/2022.
//

import XCTest
@testable import SomosMasApp

class SomosMasAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testLoginDataInUserDefaults(){
            
            let emailTest = "EmailTest@gmail.com"
            let passwordTest = "123456"
            
            let emailKeyTest = "emailTest-key"
            let passwordKeyTest = "passwordTest-key"
            
            
            let storage = UserDefaults.standard
            
            
            let loginDataTest = [passwordKeyTest: passwordTest, emailKeyTest: emailTest]
            
            let condition = passwordTest.isValidPassword && emailTest.isValidEmail
            
            XCTAssert(condition)
            
            if condition == true {
                storage.set(loginDataTest, forKey: "TestKey")
            }
            
            let dictionary = storage.object(forKey: "TestKey") as? [String: String] ?? nil
            
            XCTAssertNotNil(dictionary)
            
            
            
        }
}
