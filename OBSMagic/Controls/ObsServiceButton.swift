//
//  ObsServiceButton.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import SwiftUI

struct ObsServiceButton: View {
    @ObservedObject var obsService = OBSService.shared;
    
    var body: some View {
        Button(action: handlePress) {
            Text(text)
        }
        .disabled(disabled)
    }
    
    private var text: String {
        switch obsService.state {
            case .Idle:
                return "Connect"
            case .Authenticating:
                return "Connecting..."
            case .Starting:
                return "Connecting..."
            case .Running:
                return "Disconnect"
            case .Error:
                return "Connect"
        }
    }
    
    private var disabled: Bool {
        return obsService.state == .Running || obsService.state == .Authenticating || obsService.state == .Starting
    }
    
    private func handlePress() {
        if (obsService.state == .Idle || obsService.state == .Error) {
            obsService.start()
        } else {
            obsService.stop()
        }
    }
}

struct ObsServiceButton_Previews: PreviewProvider {
    static var previews: some View {
        ObsServiceButton()
    }
}
