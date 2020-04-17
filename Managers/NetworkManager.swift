//
//  NetworkManager.swift
//  FollowHub
//
//  Created by Dan T on 17/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import Foundation

class NetworkManager {
    
    //Every NetworkManager will have this variable on it. (NetworkManager.shared.function)
    static let shared   = NetworkManager()
    let baseURL         = "https://api.github.com/users/"
    
    // Restrict to only one instance (Singleton)
    private init() {}
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void ) {
        
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(nil, .invalidUsername)
            return
        }
        
        // Handling error
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, .unableToComplete)
                return
            }
            // Handling bad response
            //Consider creating custom response per http status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, .invalidData)
            }
        }
        
        task.resume()
    }
}
