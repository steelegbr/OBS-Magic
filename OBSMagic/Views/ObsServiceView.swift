//
//  ObsSettingsView.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import SwiftUI

struct ObsServiceView: View {
    var body: some View {
        HStack {
            ObsServiceButton()
            ObsServiceBanner()
        }
        .padding()
    }
}

struct ObsServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ObsServiceView()
    }
}
