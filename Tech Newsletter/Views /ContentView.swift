//
//  ContentView.swift
//  Tech Newsletter
//
//  Created by MAC on 01/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        VStack {
                            
                            Text(String(post.points))
                            Text("Views")
                        }
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("Latest News")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}


//let posts = [
//Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Bonjour"),
//Post(id: "3", title: "Hallo"),
//Post(id: "4", title: "Hola")
//]
