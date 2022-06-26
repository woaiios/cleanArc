//
//  SettingAPIImpl.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct SettingAPIImpl: SettingDataSource {
    
    func getSettings() async throws -> Setting {
        
        guard let url = URL(string:  "\(Constants.BASE_URL)/settings") else{
            throw APIServiceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIServiceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIServiceError.statusNotOK
        }
        
        guard let result = try? JSONDecoder().decode(Settings.self, from: data) else {
            throw APIServiceError.decodingError
        }
        
        let item = result.settings
        return Setting(
            isChatEnabled: item.isChatEnabled,
            isCallEnabled: item.isCallEnabled,
            workHours: item.workHours)
    }
}
