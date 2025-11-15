//
//  HelloMessage.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import Foundation

struct HelloMessage: Codable {
    var obsStudioVersion: String
    var obsWebSocketVersion: String
    var rpcVersion: Int
    var authentication: AuthenticationChallenge?
}
