//
//  LinkView.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 09/10/2023.
//

import SwiftUI

struct LinkView: View {
    @ObservedObject var  linkViewModel: LinkViewModel
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .frame(height: 100)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.green, lineWidth: 2)
                }
                .padding(.horizontal, 12)
                .cornerRadius(3)
            Button {
                linkViewModel.createNewLink(fromURL: text)
                text = ""
            } label: {
                Label("Crear Link", systemImage: "link")
            }
                .tint(.green)
                .controlSize(.regular)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            
            if (linkViewModel.messageError != nil) {
                Text(linkViewModel.messageError!)
                    .bold()
                    .foregroundStyle(.red)
            }
            
            List {
                ForEach(linkViewModel.links) { link in
                    VStack {
                        Text(link.title)
                            .bold()
                            .lineLimit(4)
                            .padding(.bottom, 8)
                        Text(link.url)
                            .foregroundStyle(.gray)
                            .font(.caption)
                        HStack {
                            Spacer()
                            
                            if link.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 10, height: 10)
                            }
                            if link.isFavorited {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundStyle(.yellow)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            linkViewModel.updateIscompleted(link: link)
                        }, label: {
                            Label("Completado", systemImage: "checkmark.circle.fill")
                        })
                        .tint(.green)
                        
                        Button(action: {
                            linkViewModel.updateIsFavorited(link: link)
                        }, label: {
                            Label("Favorito", systemImage: "star.fill")
                        })
                        .tint(.yellow)
                    } 
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            linkViewModel.deleteLink(link: link)
                        }, label: {
                            Label("Borrar", systemImage: "trash.fill")
                        })
                        .tint(.red)
                        
                
                    }
                }
            }
            .task {
                linkViewModel.getAllLinks()
            }
        }
    }
}

#Preview {
    LinkView(linkViewModel: LinkViewModel())
}
