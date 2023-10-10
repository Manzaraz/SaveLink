//
//  LinkRepository.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 09/10/2023.
//

import Foundation

final class LinkRepository {
    private let linkDataSource: LinkDataSource
    private let metadataDatasource: MetadataDatasource
    
    init(
        linkDataSource: LinkDataSource = LinkDataSource(),
        metadataDatasource: MetadataDatasource = MetadataDatasource()
    ) {
        self.linkDataSource = linkDataSource
        self.metadataDatasource = metadataDatasource
    }
    
    func getAllLinks(completionBlock: @escaping (Result<[LinkModel], Error>) -> Void) {
        linkDataSource.getAllLinks(completionBlock: completionBlock)
    }
    
    func createNewLink(withURL url: String, completionBlock: @escaping (Result<LinkModel, Error>) -> Void ) {
        metadataDatasource.getMetadata(fromURL: url, completionBlock: completionBlock)
    }
    
    
}
