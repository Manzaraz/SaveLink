//
//  ContentView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 05/10/2023.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView:  AuthenticationSheetView?
        
    var body: some View {
        VStack {
            Image("iManziLogo")
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                
                
            VStack {
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Entrá con Email", systemImage: "envelope.fill")
                }
                .tint(.black)
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule )
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("¿No tienes cuenta?")
                    Text("Registrate")
                        .underline()
                }
                .tint(.black)
            }
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .register:
                RegisterEmailView(authenticationViewModel: authenticationViewModel)
            case .login:
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}

#Preview {
    AuthenticationView(authenticationViewModel: AuthenticationViewModel())
}
