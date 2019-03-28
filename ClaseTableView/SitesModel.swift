//
//  SitesModel.swift
//  ClaseTableView
//
//  Created by Nicolas Frugoni on 3/21/19.
//  Copyright © 2019 Nicolas Frugoni. All rights reserved.
//

import Foundation

class SitesModel: SitesModelProtocol {
    
    weak var delegate: SiteViewControllerProtocol?
    var service: SitesService!
    
    init(delegate: SiteViewControllerProtocol) {
        self.delegate = delegate
        setupService()
    }
    
    func setupService() {
        service = SitesService(delegate: self)
    }
    
    func getAllSites() {
        service.getSites()
    }
    
    func successFetchingSites(sites: [Site]) {
        delegate?.reloadTableView(sites: sites)
    }
}

struct Site: Codable {
    let id: String
    let name: String
}
