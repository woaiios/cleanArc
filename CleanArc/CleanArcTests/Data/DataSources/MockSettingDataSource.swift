//
//  CleanArcTests.swift
//  CleanArcTests
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import XCTest
@testable import CleanArc

class MockSettingDataSource: SettingDataSource {
    
    var result: Setting = Setting()
    var getSettingsGotCalled = false
    
    func getSettings() async throws -> Setting {
        getSettingsGotCalled = true
        return result
    }
}
