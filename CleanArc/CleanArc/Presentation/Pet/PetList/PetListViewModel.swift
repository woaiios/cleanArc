//
//  PetListViewModel.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

@MainActor
class PetListViewModel: ObservableObject {
    
    var getPetsUseCase = GetPetsUseCase(repo: PetRepositoryImpl(dataSource: PetAPIImpl()))
    @Published var pets: [Pet] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getPets() async {
        errorMessage = ""
        let result = await getPetsUseCase.execute()
        switch result{
        case .success(let pets):
            self.pets = pets
        case .failure(let error):
            self.pets = []
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}
