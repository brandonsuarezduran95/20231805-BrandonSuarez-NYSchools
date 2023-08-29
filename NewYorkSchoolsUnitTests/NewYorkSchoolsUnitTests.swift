//
//  NewYorkSchoolsUnitTests.swift
//  NewYorkSchoolsUnitTests
//
//  Created by Brandon Suarez on 5/19/23.
//

import XCTest
@testable import NewYorkSchoolsTest

final class NewYorkSchoolsUnitTests: XCTestCase {
    
    var schoolData: [School] = []
    var satData: [SatResult] = []
    
    func testFetchSchoolData() {
        // Setting up the expectation
        let expectation = self.expectation(description: "SchoolDataFetched")
        // Mocking a fetch request
        NetworkService().fetchSchoolsData { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.schoolData = data
                    // Asserting the success of fetching the data
                    expectation.fulfill()
                }
            default:
                break
            }
        }
        // The test will pass if we data is fetched in less than a second
        waitForExpectations(timeout: 1)
        // Assert that there is populated data in the schoolData variable
        XCTAssertGreaterThan(schoolData.count, 1)
    }
    
    func testFetchSatData() {
        // Setting up the expectation
        let expectation = self.expectation(description: "SatDataFetched")
        // Mocking a fetch request
        NetworkService().fetchSatData { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.satData = data
                    // Asserting the success of fetching the data
                    expectation.fulfill()
                }
            default:
                break
            }
        }
        // The test will pass if we data is fetched in less than a second
        waitForExpectations(timeout: 1)
        // Assert that there is populated data in the schoolData variable
        XCTAssertGreaterThan(satData.count, 1)
    }
}
