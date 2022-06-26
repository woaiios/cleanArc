//
//  CleanArcTests.swift
//  CleanArcTests
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import XCTest
@testable import CleanArc

class MockPetDataSource: PetDataSource {
    
    var getAllResult: [Pet]  = []
    var getPetsGotCalled = false
    
    func getPets() async throws -> [Pet] {
        getPetsGotCalled = true
        return getAllResult
    }
    
}
