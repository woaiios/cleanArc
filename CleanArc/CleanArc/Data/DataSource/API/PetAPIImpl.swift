//
//  PetAPIImpl.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct PetAPIImpl: PetDataSource {
    
       
    func getPets() async throws -> [Pet] {
        
        guard let url = URL(string:  "\(Constants.BASE_URL)/pets") else{
            throw APIServiceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIServiceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIServiceError.statusNotOK
        }
        
        guard let result = try? JSONDecoder().decode(Pets.self, from: data) else {
            throw APIServiceError.decodingError
        }
        
        return result.pets.map({ item in
            Pet(imageUrl: item.image_url,
                title: item.title,
                contentUrl: item.content_url,
                DateAdded: item.date_added)
        })
    }
}
