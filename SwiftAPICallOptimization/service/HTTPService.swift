//
//  HTTPService.swift
//  SwiftAPICallOptimization
//
//  Created by Mattosha on 10/05/2023.
//

import Foundation

class HTTPService : ObservableObject {
    static let instance : HTTPService = HTTPService()
    
    let session  = URLSession.shared
    
    func getDoc<T : Codable>(of type : T.Type, request : URLRequest) async throws -> DocQueryResponse<T>{
        do{
            let (data,_) =  try await session.data(for: request)
            
            let response = try JSONDecoder().decode(T.self, from: data)
            
            return DocQueryResponse(status: .success, item: response)
        }catch let DecodingError.dataCorrupted(context) {
            
            return DocQueryResponse(status: .error, errorMessage: " \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.keyNotFound(key, context) {
            
            return DocQueryResponse(status: .error, errorMessage: "Key '\(key)' not found:: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            
            return DocQueryResponse(status: .error, errorMessage: "Value '\(value)' not found:: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context)  {
            
            return DocQueryResponse(status: .error, errorMessage: "Type '\(type)' mismatch: \(context.debugDescription), codingPath :, \(context.codingPath)")
        }catch{
            return DocQueryResponse(status: .error, errorMessage: error.localizedDescription)
        }
    }
    
    
    func getDocs<T : Codable>(of type : T.Type,request : URLRequest) async throws -> ListQueryResponse<T>{
        do{
            
            let (data,_) = try await session.data(for: request)
            
            let response = try JSONDecoder().decode([T].self,from: data)
           
            return ListQueryResponse(status: .success, list: response)
            
        }catch let DecodingError.dataCorrupted(context) {
            
            return ListQueryResponse(status: .error, errorMessage: " \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.keyNotFound(key, context) {
            
            return ListQueryResponse(status: .error, errorMessage: "Key '\(key)' not found:: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            
            return ListQueryResponse(status: .error, errorMessage: "Value '\(value)' not found:: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context)  {
            
            return ListQueryResponse(status: .error, errorMessage: "Type '\(type)' mismatch: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch  {
            return ListQueryResponse(status: .error, errorMessage: error.localizedDescription )
        }
    }
    
    
    func mutate<T : Codable>(of type : T.Type,request : URLRequest) async throws -> MutationResponse<T>{
        do{
            
            let (data,_) = try await session.data(for: request)
            
            let response = try JSONDecoder().decode(T.self,from: data)
           
            return MutationResponse(status: .success, data: response)
            
        }catch let DecodingError.dataCorrupted(context) {
            
            return MutationResponse(status: .error, errorMessage: " \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.keyNotFound(key, context) {
            
            return MutationResponse(status: .error, errorMessage: "Key '\(key)' not found:: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            
            return MutationResponse(status: .error, errorMessage: "Value '\(value)' not found:: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context)  {
            
            return MutationResponse(status: .error, errorMessage: "Type '\(type)' mismatch: \(context.debugDescription), codingPath :, \(context.codingPath)")
        } catch  {
            return MutationResponse(status: .error, errorMessage: error.localizedDescription )
        }
    }
    
}


