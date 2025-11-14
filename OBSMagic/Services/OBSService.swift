//
//  OBSService.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import Combine
import Foundation

enum OBSServiceState {
    case Idle
    case Starting
    case Authenticating
    case Running
    case Error
}

class OBSService: ObservableObject {
    static let shared = OBSService()
    
    @Published
    var state: OBSServiceState = .Idle
    
    func start() {
        if (state == .Authenticating || state == .Running || state == .Starting) {
            print("Can't start the OBS service as it's in the \(state) state")
            return
        }
        
        print("Starting OBS service")
        state = .Authenticating
    }
    
    func stop() {
        if (state == .Idle || state == .Error) {
            print("Can't stop the OBS service as it's in the \(state) state")
            return
        }
        
        print("Stopping OBS service")
        state = .Idle
    }
}
