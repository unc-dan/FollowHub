//
//  ErrorMessage.swift
//  FollowHub
//
//  Created by Dan T on 17/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import Foundation
//enum raw value is string, all cases are string. associated values are when each case has individual type
enum ErrorMessage: String {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
