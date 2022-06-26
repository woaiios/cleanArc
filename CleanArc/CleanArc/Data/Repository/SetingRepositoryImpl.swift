//
//  SettingRepositoryImpl.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct SettingRepositoryImpl: SettingRepository {
    
    var dataSource: SettingDataSource
    
    func getSettings() async throws -> Setting {
        return try await dataSource.getSettings()
    }
}
