//
//  LinkViewModel.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 09/10/2023.
//

import Foundation

final class LinkViewModel: ObservableObject {
    @Published var links: [LinkModel] = []
    @Published var messageError: String?
    private let linkRepository: LinkRepository
    
    init(linkRepository: LinkRepository = LinkRepository()) {
        self.linkRepository = linkRepository
    }
    
    func getAllLinks() {
        linkRepository.getAllLinks { [weak self] result in
            switch result {
            case . success(let linkModels):
                self?.links = linkModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func createNewLink(fromURL url: String) {
        linkRepository.createNewLink(withURL: url) { [weak self] result in
            switch result {
            case .success(let link):
                print("✅ New link \(link.title) added")
            case .failure(let error):
                self? .messageError = error.localizedDescription
            }
        }
    }
    
    func updateIsFavorited(link: LinkModel) {
        let updatedLink = LinkModel(
            id: link.id,
            url: link.url,
            title: link.title,
            isFavorited: link.isFavorited ? false : true,
            isCompleted: link.isCompleted)
        
        linkRepository.updateLink(link: updatedLink)
    }
    
    func updateIscompleted(link: LinkModel) {
        let updatedLink = LinkModel(
            id: link.id,
            url: link.url,
            title: link.title,
            isFavorited: link.isFavorited,
            isCompleted: link.isCompleted ? false : true)
        
        linkRepository.updateLink(link: updatedLink)
    }
    
    func deleteLink(link: LinkModel) {
        linkRepository.deleteLink(link: link)
    }
    
    
}
