//
//  PostQueries.swift
//  SwiftAPICallOptimization
//
//  Created by Mattosha on 10/05/2023.
//

import Foundation


class PostQueries : ObservableObject {
    
    static let instance : PostQueries = PostQueries()
    
    
    func getPostByIdQuery(_ postId : Int) -> URLRequest{
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)")
        
        var request = URLRequest(url: url!, timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        return request
    }
    
    func getPostsQuery() -> URLRequest {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        var request = URLRequest(url: url!, timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        return request
    }
}
