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

struct PostInput : Codable{
    var id : Int?
    let title : String
    let body : String
    let userId : Int
}

struct UpdatePostInput : Codable{
    var id : Int?
    var title : String?
    var body : String?
    var userId : Int?
}


