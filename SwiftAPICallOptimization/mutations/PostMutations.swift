//
//  PostMutations.swift
//  SwiftAPICallOptimization
//
//  Created by Mattosha on 15/05/2023.
//

import Foundation


class PostMutations : ObservableObject {
    static let instance : PostMutations = PostMutations()
    
    func createPostMutation( input : PostInput)-> URLRequest{
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        var request = URLRequest(url: url!, timeoutInterval: Double.infinity)
        
        let postData = try? JSONEncoder().encode(input)
        
        request.httpBody = postData
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        
        return request
    
    }
    
    func updatePostMutation( input : PostInput)-> URLRequest{
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(input.id ?? 0)")
        
        var request = URLRequest(url: url!, timeoutInterval: Double.infinity)
        
        let postData = try? JSONEncoder().encode(input)
        
        request.httpBody = postData
        request.httpMethod = "PUT"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        
        return request
    
    }
    
    func editPostMutation( input : UpdatePostInput)-> URLRequest{
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(input.id ?? 0)")
        
        var request = URLRequest(url: url!, timeoutInterval: Double.infinity)
        
        let postData = try? JSONEncoder().encode(input)
        
        request.httpBody = postData
        request.httpMethod = "PATCH"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        
        return request
    
    }
    
    func deletePostMutation( postId : Int)-> URLRequest{
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)")
        
        var request = URLRequest(url: url!, timeoutInterval: Double.infinity)
        
       
        request.httpMethod = "DELETE"
     
        
        return request
    
    }
}
