//
//  FHAvatarImageView.swift
//  FollowHub
//
//  Created by Dan T on 17/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

class FHAvatarImageView: UIImageView {
    
    let cache            = NetworkManager.shared.cache
    let placeholderImage = UIImage(named: "avatar-placeholder")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true //We have to do this otherwise only the UIImageView will have corner radius, not the actual image within
        image              = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        // once image is in the cache, we return from the function. (so we only download image once)
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        // network call
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        // return from function if there's an error
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
        // if data is good and we get the image - we set the image in to the cache
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
        // go to main thread and set the image that we downloaded, if image is already in cache we aren't here.
            DispatchQueue.main.async { self.image = image }
            
        }
        
        task.resume()
    }
    
}
