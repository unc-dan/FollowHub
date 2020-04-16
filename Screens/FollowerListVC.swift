//
//  FollowerListVC.swift
//  FollowHub
//
//  Created by Dan T on 16/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Prevents nav bar from disappearing when half way swiping back and forward from Followers/Search. We create viewWillAppear and place isNBH inside, cut from viewDidLoad()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
