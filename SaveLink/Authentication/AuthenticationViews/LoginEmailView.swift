//
//  LoginEmailView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 06/10/2023.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var textFieldEmail: String = ""
    @State private var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            DismissView()
                .padding(.top, 8)
            
            Group {
                Text("👋🏼 Bienvenido de nuevo a")
                Text("iManzi")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            
            Group {
                Text("Loguéate de nuevo para poder acceder a todos tus enlaces.")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                
                TextField("Ingresá tu correo electrónico", text: $textFieldEmail)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                SecureField("Ingresá tu contraseña", text: $textFieldPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                
                Button("Login") {
                    authenticationViewModel.login(
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
                        .foregroundStyle(.red)
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
    LoginEmailView(authenticationViewModel: AuthenticationViewModel() )
}
