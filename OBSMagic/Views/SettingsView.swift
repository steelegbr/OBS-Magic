//
//  SettingsView.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(Constants.settingsObsDomain) private var obsDomain: String = "localhost"
    @AppStorage(Constants.settingsObsPassword) private var obsPassword: String = ""
    
    
    var body: some View {
        Form {
            TextField("OBS Server", text: $obsDomain)
            SecureField("Password", text: $obsPassword)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
