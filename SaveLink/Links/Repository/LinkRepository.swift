//
//  LinkRepository.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 09/10/2023.
//

import Foundation

final class LinkRepository {
    private let linkDataSource: LinkDataSource
    
    init(linkDataSource: LinkDataSource = LinkDataSource()) {
        self.linkDataSource = linkDataSource
    }
    
    func getAllLinks(completionBlock: @escaping (Result<[LinkModel], Error>) -> Void) {
        linkDataSource.getAllLinks(completionBlock: completionBlock)
    }
}
