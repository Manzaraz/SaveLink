//
//  RegisterEmailView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 06/10/2023.
//

import SwiftUI

struct RegisterEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var textFieldEmail: String = ""
    @State private var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            DismissView()
                .padding(.top, 8)
            
            Group {
                Text("👋🏼 Bienvenido a")
                Text("iManzi")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            
            Group {
                Text("Regístrate para guardar todos tus enlaces en una sola app.")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                
                TextField("Ingresá tu correo electrónico", text: $textFieldEmail)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                TextField("Ingresá tu contraseña", text: $textFieldPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                
                Button("Aceptar") {
                    authenticationViewModel.createNewUser(
                        email: textFieldEmail,
                        password: textFieldPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundStyle(Color.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
    }
}

#Preview {
    RegisterEmailView(authenticationViewModel: AuthenticationViewModel() )
}
