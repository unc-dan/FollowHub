//
//  User.swift
//  FollowHub
//
//  Created by Dan T on 16/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
