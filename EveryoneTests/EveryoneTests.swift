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
        let expectation = self.expectation(description: "decoding")

        
        WebHandler.getEmployeeDetails(employerUuid: UUID(uuidString: "d92eb9dc-566d-4427-87c3-ee14c19b4d14")!, id: 2) { employee in
            XCTAssertEqual(employee?.name, "Toby")
            XCTAssertEqual(employee?.employeeId, 2)
            XCTAssertEqual(employee?.genderIdentity, "Genderfluid")
            XCTAssertEqual(employee?.sexualOrientation, "Bisexual")
            XCTAssertEqual(employee?.ethnicity, "Arab")
            XCTAssertEqual(employee?.employerId, 2)
            XCTAssertEqual(employee?.pronoun, "he/him")
            expectation.fulfill()

        }
        waitForExpectations(timeout: 20, handler: nil)

    }
    
    func testCreateEmployee() throws {
        let expectation = self.expectation(description: "creating")
        let name = "Test1"
        let genderIdentity = "Male"
        let sexualOrientation = "Heterosexual"
        let ethnicity = "Arab"
        let id = 3
        let pronoun = "he/him"
        let employee = Employee(name: name, genderIdentity: genderIdentity, sexualOrientation: sexualOrientation, ethnicity: ethnicity, employerId: id, pronoun: pronoun)
        
        WebHandler.loginEmployee(email: "passwordistest123123@gmail.com", password: "test123123") { uuid in
        WebHandler.createEmployee(employerUuid: uuid!, employee: employee, completionHandler: { result in
            XCTAssert(result == 0)
            expectation.fulfill()
        })
        }
        waitForExpectations(timeout: 20, handler: nil)

    }
    
    func testRegisterEmployer() throws {
        let expectation = self.expectation(description: "registering")
        WebHandler.registerEmployer(email: "testtest@gmail.com", password: "1234") { result in
            XCTAssert(result == 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    
    func testLoginEmployer() throws {
        let expectation = self.expectation(description: "logining in")
        WebHandler.loginEmployee(email: "passwordistest123123@gmail.com", password: "test123123") { result in
            XCTAssert(result != nil)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    
    func testGetDepartments() throws {
        let expectation = self.expectation(description: "getting departments")
        WebHandler.loginEmployee(email: "passwordistest123123@gmail.com", password: "test123123") { result in
            XCTAssert(result != nil)
            guard let uuid = result else {
                return }
            WebHandler.getDepartments(uuid: uuid, completionHandler: { departments in
                guard let departments = departments else {
                    return
                }
                XCTAssert(departments.count != 0)
            expectation.fulfill()
            })
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    
    func testGetEmployees() throws {
        let expectation = self.expectation(description: "getting all employees")
        WebHandler.loginEmployee(email: "passwordistest123123@gmail.com", password: "test123123") { result in
            XCTAssert(result != nil)
            guard let uuid = result else {
                return }
            WebHandler.getAllEmployees(uuid: uuid, completionHandler: { employees in
                guard let employees = employees else {
                    return
                }
                XCTAssert(employees.count != 0)
            expectation.fulfill()
            })
        }
        waitForExpectations(timeout: 20, handler: nil)
    }

}
