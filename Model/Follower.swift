//
//  Follower.swift
//  FollowHub
//
//  Created by Dan T on 16/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    //if we want specific variable to be hashed rather than everything in Follower (slight optimisation)
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}

