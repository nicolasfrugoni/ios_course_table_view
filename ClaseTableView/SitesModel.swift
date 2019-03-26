//
//  SitesModel.swift
//  ClaseTableView
//
//  Created by Nicolas Frugoni on 3/21/19.
//  Copyright © 2019 Nicolas Frugoni. All rights reserved.
//

import Foundation

class SitesModel {
    
    var sites: [Site] = []
    
    func getAllSites() -> [Site] {
        guard let jsonData = SitesMock.sitesJson.data(using: .utf8) else { return sites }
        
        do {
            sites = try JSONDecoder().decode([Site].self, from: jsonData)
        } catch {
            print("It failed")
        }
        return sites
    }
    
}

struct Site: Codable {
    let id: String
    let name: String
}
