//
//  SettingDataSource.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

protocol SettingDataSource {
    func getSettings() async throws -> Setting
}
