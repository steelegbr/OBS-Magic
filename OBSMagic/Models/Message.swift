//
//  Message.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import Foundation

enum MessageContent: Codable {
    case hello(HelloMessage)
}

struct Message: Codable {
    var message: MessageContent
    
    enum CodingKeys: String, CodingKey {
        case op
        case d
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let op = try container.decode(OpCode.self, forKey: .op)
        
        switch op {
            case .Hello:
                let content = try container.decode(HelloMessage.self, forKey: .d)
                message = .hello(content)
        }
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch message {
            case .hello(let content):
                try container.encode(OpCode.Hello, forKey: .op)
                try container.encode(content, forKey: .d)
        }
    }

}
