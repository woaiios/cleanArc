//
//  GetSettings.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//


protocol GetSettings {
    
    func execute() async -> Result<Setting, UseCaseError>
}

import Foundation


struct GetSettingsUseCase: GetSettings{
    
    var repo: SettingRepository
    
    func execute() async -> Result<Setting, UseCaseError> {
        
        do {
            let settings = try await repo.getSettings()
            return .success(settings)
            
        } catch(let error) {
            
            switch(error) {
            case APIServiceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
