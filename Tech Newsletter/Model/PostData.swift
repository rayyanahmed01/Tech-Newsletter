//
//  PostData.swift
//  Tech Newsletter
//
//  Created by MAC on 02/01/2024.
//

import Foundation


struct Results: Decodable {
    let hits: [Posts]
    
}

struct Posts: Decodable, Identifiable{
    
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    
}
