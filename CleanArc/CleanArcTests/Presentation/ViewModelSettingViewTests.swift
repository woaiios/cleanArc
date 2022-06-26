//
//  CleanArcTests.swift
//  CleanArcTests
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import XCTest
@testable import CleanArc

class ViewModelSettingViewTests: XCTestCase {
    var vm: SettingViewModel!
    var settingDataSource: MockSettingDataSource!
    @MainActor override func setUp() {
        settingDataSource = MockSettingDataSource()
        vm = SettingViewModel()
        vm.getSettingsUseCase = GetSettingsUseCase(repo:
                                                    SettingRepositoryImpl(dataSource: settingDataSource))
    }

    @MainActor func test_get_setting_value_success() async {
        settingDataSource.result = Setting(isChatEnabled: true, isCallEnabled: true, workHours: "M-F 9:00 - 18:00")
        await vm.getSettings()
        XCTAssertTrue(vm.settings.isChatEnabled)
        XCTAssertTrue(vm.settings.isCallEnabled)
        
        let dateFormatterWithHour = DateFormatter()
        dateFormatterWithHour.dateFormat = "yyyy-MM-dd HH:mm"
        XCTAssertTrue(vm.showCantact(dateFormatterWithHour.date(from: "2022-06-27 10:20")!))
    }
    
    @MainActor func test_workhour() async {
        settingDataSource.result = Setting(isChatEnabled: true, isCallEnabled: true, workHours: "M-F 9:00 - 18:00")
        await vm.getSettings()
        
        let dateFormatterWithHour = DateFormatter()
        dateFormatterWithHour.dateFormat = "yyyy-MM-dd HH:mm"
        XCTAssertFalse(vm.showCantact(dateFormatterWithHour.date(from: "2022-06-27 19:20")!))
    }
}
