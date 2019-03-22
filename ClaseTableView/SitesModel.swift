//
//  SitesModel.swift
//  ClaseTableView
//
//  Created by Nicolas Frugoni on 3/21/19.
//  Copyright © 2019 Nicolas Frugoni. All rights reserved.
//

import Foundation

class SitesModel {
    
    let sites = [Site(id: "MLA", name: "Argentina"),
                 Site(id: "MLB", name: "Brasil"),
                 Site(id: "MLV", name: "Venezuela (Deprecado)"),
                 Site(id: "MLM", name: "Mexico")]
    
    func getAllSites() -> [Site] {
        return sites
    }
    
}

struct Site {
    let id: String
    let name: String
}
