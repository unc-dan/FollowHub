//
//  FHAvatarImageView.swift
//  FollowHub
//
//  Created by Dan T on 17/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

class FHAvatarImageView: UIImageView {
    
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
    
}
