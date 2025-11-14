//
//  ObsServiceBanner.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import SwiftUI

struct ObsServiceBanner: View {
    @ObservedObject var obsService = OBSService.shared
    
    var body: some View {
        Text(text)
            .foregroundStyle(colour)
            .font(.headline)
    }
    
    private var text: String {
        switch obsService.state {
            case .Idle:
                return "Idle"
            case .Authenticating:
                return "Authenticating"
            case .Error:
                return "Error"
            case .Running:
                return "Running"
            case .Starting:
                return "Starting"
        }
    }
    
    private var colour: Color {
        switch obsService.state {
            case .Idle:
                return .red
            case .Authenticating:
                return .orange
            case .Error:
                return .red
            case .Running:
                return .green
            case .Starting:
                return .orange
        }
    }
}

struct ObsServiceBanner_Previews: PreviewProvider {
    static var previews: some View {
        ObsServiceBanner()
    }
}
