//
//  PetAPIEntity.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct Pets: Codable {
    let pets: [PetAPIEntity]
}

struct PetAPIEntity: Codable {
    let image_url: String
    let title: String
    let content_url: String
    let date_added: String
}
