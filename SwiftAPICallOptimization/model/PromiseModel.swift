//
//  PromiseModel.swift
//  SwiftAPICallOptimization
//
//  Created by Mattosha on 10/05/2023.
//

import Foundation

enum QueryStatus : String{
    case success
    case error
}


struct DocQueryResponse<T>{
    let status : QueryStatus
    let errorMessage : String?
    let item : T?
    
    init(status: QueryStatus, errorMessage: String? = nil, item: T? = nil) {
        self.status = status
        self.errorMessage = errorMessage
        self.item = item
    }
}


struct ListQueryResponse<T>{
    let status : QueryStatus
    let errorMessage : String?
    let list  : [T]?
    
    init(status: QueryStatus, errorMessage: String? = nil, list: [T]? = nil) {
        self.status = status
        self.errorMessage = errorMessage
        self.list = list
    }
}


struct MutationResponse<T>{
    let status : QueryStatus
    let errorMessage : String?
    let data : T?
    
    init(status: QueryStatus, errorMessage: String? = nil, data: T? = nil) {
        self.status = status
        self.errorMessage = errorMessage
        self.data = data
    }
    
}
