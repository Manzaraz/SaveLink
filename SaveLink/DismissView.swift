//
//  DismissView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 06/10/2023.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            Button("Cerrar") {
                dismiss()
            }
            .tint(.blue)
            .padding(.trailing, 12)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    DismissView()
}
