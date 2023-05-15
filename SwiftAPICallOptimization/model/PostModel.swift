//
//  PostModel.swift
//  SwiftAPICallOptimization
//
//  Created by Mattosha on 11/05/2023.
//

import Foundation


struct PostDoc : Codable {
    let userID, id: Int?
    let title, body: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case body
    }
}
