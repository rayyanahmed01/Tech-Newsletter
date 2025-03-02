//
//  NetworkManager.swift
//  Tech Newsletter
//
//  Created by MAC on 02/01/2024.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Posts]()
    
    func fetchData(){
        
    
        
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, reponse, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            
//                          Since posts has a listening property, the update must happen in the main thread and not in the background. 
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                                                    }
                        catch{
                            print(error)
                        }
                        
                    }
                    
                }
            }
            task.resume()
        }
        
    }
    
    
}
