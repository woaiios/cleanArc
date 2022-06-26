//
//  SettingAPIEntity.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct Settings: Codable {
    let settings: SettingAPIEntity
}

struct SettingAPIEntity: Codable {
    let isChatEnabled: Bool
    let isCallEnabled: Bool
    let workHours: String
}
