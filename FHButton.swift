//
//  FHButton.swift
//  FollowHub
//
//  Created by Dan T on 15/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

class FHButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    // This init is for handling storyboards, we have to put it here or xcode will complain
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Custom initialiser which takes 2 parameters. So we don't have to configure the whole code every time we use the button.
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
