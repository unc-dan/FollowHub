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
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void ) {
        
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        // Handling error
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            // Handling bad response
            //Consider creating custom response per http status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
