//
//  HomeView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 06/10/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                VStack {
                    Text("Bienvenido \(authenticationViewModel.user?.email ?? "No user")")
                        .padding(.top, 32)
                    Spacer()
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                
                ProfileView(authenticationViewModel: authenticationViewModel)
                    .tabItem {
                        Label("Person", systemImage: "person.fill")
                    }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                Button("Logout") {
                    authenticationViewModel.logout()
                }
            }
        }
    }
}

#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
