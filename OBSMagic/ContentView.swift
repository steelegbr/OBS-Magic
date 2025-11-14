//
//  ContentView.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            SettingsView()
            ObsServiceView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
