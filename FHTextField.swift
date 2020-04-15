//
//  FHTextField.swift
//  FollowHub
//
//  Created by Dan T on 15/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

class FHTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        // When using layer.borderColor we need to use CG colors. So we can't just use .systemcolor
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        // .label color will be black on light mode and white on dark mode
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        
        placeholder                 = "Enter a username"
    }
}
