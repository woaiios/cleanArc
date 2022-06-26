//
//  Pet.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

struct Pet: Identifiable, Equatable {
    
    var id: String {
        return DateAdded + contentUrl + title + imageUrl
    }
    
    let imageUrl: String
    let title: String
    let contentUrl: String
    let DateAdded: String
}
