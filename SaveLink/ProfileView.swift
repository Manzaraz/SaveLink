//
//  ProfileView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 09/10/2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var expandVerificationWithEmailForm: Bool = false
    @State var textFieldEmail: String  = ""
    @State var textFieldPassword: String  = ""
    
    var body: some View {
        Form {
            Section {
                Button(action: {
                    expandVerificationWithEmailForm.toggle()
                }, label: {
                    Label("Vincula Email", systemImage: "envelope.fill")
                })
                .disabled(authenticationViewModel.isEmailAndPasswordLinked())
                if expandVerificationWithEmailForm {
                    Group {
                        Text("Vincula tu correo electrónico con la sesión con la que tienes actualmente iniciada.")
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
                        
                        Button("Aceptar") {
                            authenticationViewModel.linkEmailAndPassword(
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
                    
                }
                
                Button(action: {
                    authenticationViewModel.linkFacebook()
                }, label: {
                    Label("Vincula Facebook", image: "facebook")
                })
                .disabled(authenticationViewModel.isFacebookLinked())
                
                
            } header: {
                Text("vincula otras cuentas a la sesión actual")
            }            
        }
        .task {
            authenticationViewModel.getCurrentProvider()
        }
        .alert(authenticationViewModel.isAccountLinked ? "¡Cuenta Vinculada!" : "Error",
               isPresented: $authenticationViewModel.showAlert) {
            Button("Aceptar") {
                print("Dismiss Alert")
                if authenticationViewModel.isAccountLinked {
                    expandVerificationWithEmailForm = false
                }
            }
        } message: {
            Text(authenticationViewModel.isAccountLinked ? "✅ Acabas de vincular tu cuenta" : "❌ Error al vincular la cuenta")
        }

    }
}

#Preview {
    ProfileView(authenticationViewModel: AuthenticationViewModel())
}
