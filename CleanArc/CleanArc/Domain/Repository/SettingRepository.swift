//
//  SettingRepository.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

protocol SettingRepository {

    func getSettings() async throws -> Setting
}
