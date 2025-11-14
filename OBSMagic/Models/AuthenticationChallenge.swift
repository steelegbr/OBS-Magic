//
//  AuthenticationChallenge.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import Foundation

struct AuthenticationChallenge: Codable {
    var challenge: String
    var salt: String
}
