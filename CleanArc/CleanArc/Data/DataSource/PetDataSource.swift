//
//  PetDataSource.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

protocol PetDataSource {
    func getPets() async throws -> [Pet]
}
