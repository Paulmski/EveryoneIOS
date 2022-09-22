//
//  EveryoneTests.swift
//  EveryoneTests
//
//  Created by Paul Molczanski on 2022-09-19.
//

import XCTest
@testable import Everyone

class EveryoneTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    
    func testGetEmployee() throws {
        let webHandler = WebHandler()
        let expectation = self.expectation(description: "decoding")

        
        webHandler.getEmployeeDetails(employerUuid: UUID(uuidString: "d92eb9dc-566d-4427-87c3-ee14c19b4d14")!, id: 2) { employee in
            XCTAssertEqual(employee?.name, "Toby")
            XCTAssertEqual(employee?.genderIdentity, "Genderfluid")
            XCTAssertEqual(employee?.sexualOrientation, "Bisexual")
            XCTAssertEqual(employee?.ethnicity, "Arab")
            XCTAssertEqual(employee?.employerId, 2)
            XCTAssertEqual(employee?.pronoun, "he/him")
            expectation.fulfill()
            
        }
        waitForExpectations(timeout: 20, handler: nil)

    }

}
