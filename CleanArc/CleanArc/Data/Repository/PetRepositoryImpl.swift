//
//  PetRepositoryImpl.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct PetRepositoryImpl: PetRepository {
    
    var dataSource: PetDataSource
    
    func getPets() async throws -> [Pet] {
        return try await dataSource.getPets()
    }
}
