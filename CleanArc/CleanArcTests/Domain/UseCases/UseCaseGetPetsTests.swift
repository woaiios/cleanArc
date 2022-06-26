//
//  CleanArcTests.swift
//  CleanArcTests
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import XCTest
@testable import CleanArc

class UseCaseGetPetsTests: XCTestCase {
    var useCase: GetPetsUseCase!
    var mockPetRepository : MockPetRepository!
    
    override func setUp() {
        mockPetRepository = MockPetRepository()
        useCase = GetPetsUseCase(repo: mockPetRepository)
    }
    
    func test_repo_getPets_should_be_called() async {
        let expectedResult: [Pet] = [Pet(imageUrl: "",
                                         title: "",
                                         contentUrl: "",
                                         DateAdded: "2018-06-23T19:24:23.027Z")]
        mockPetRepository.getPetsResult = expectedResult
        let response = await useCase.execute()
        XCTAssertEqual(response, .success(expectedResult))
        XCTAssertTrue(mockPetRepository.getPetsGotCalled)
    }
    
    
}
