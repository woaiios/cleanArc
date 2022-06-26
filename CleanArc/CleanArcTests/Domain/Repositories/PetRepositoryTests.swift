//
//  CleanArcTests.swift
//  CleanArcTests
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import XCTest
@testable import CleanArc


class PetRepositoryTests: XCTestCase {
    var repo: PetRepository!
    var petDataSource : MockPetDataSource!
    
    override func setUp() {
        petDataSource = MockPetDataSource()
        repo = PetRepositoryImpl(dataSource: petDataSource)
        
    }
    
    func test_petDataSource_getAll_should_be_called() async throws {
        let expectedResult: [Pet] = [Pet(imageUrl: "",
                                         title: "",
                                         contentUrl: "",
                                         DateAdded: "2018-06-23T19:24:23.027Z")]
        petDataSource.getAllResult = expectedResult
        let response = try await repo.getPets()
        XCTAssertTrue(petDataSource.getPetsGotCalled)
        XCTAssertEqual(response, expectedResult)
    }
    
}
