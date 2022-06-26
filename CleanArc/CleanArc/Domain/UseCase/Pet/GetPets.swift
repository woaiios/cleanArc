//
//  GetPets.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

protocol GetPets {
    
    func execute() async -> Result<[Pet], UseCaseError>
}

import Foundation


struct GetPetsUseCase: GetPets{
    
    var repo: PetRepository
    
    func execute() async -> Result<[Pet], UseCaseError> {
        
        do {
            
            let pets = try await repo.getPets()
            return .success(pets)
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
