//
//  HomeView.swift
//  SwiftAPICallOptimization
//
//  Created by Mattosha on 11/05/2023.
//

import SwiftUI

struct HomeView: View {
    @State var loading : Bool = false
    @State var fetchTask : Task<(),Never>? = nil
    
    var body: some View {
        Group{
            if loading{
                ProgressView()
            }else{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .onAppear{
                fetch()
            }
    }
    
    func fetch(){
        fetchTask  = Task{
            loading = true
            let response = try? await  HTTPService.instance.getDocs(of: PostDoc.self, request: PostQueries.instance.getPostsQuery())
            loading = false
            
            if response?.status == .success{
                print(response?.list ?? "")
            }
            
            if response?.status == .error{
                print(response?.errorMessage ?? "")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
