//
//  Message.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import Foundation

enum MessageContent: Codable {
    case HelloMessage
}

struct Message: Codable {
    var op: OpCode
    var d: MessageContent
}
