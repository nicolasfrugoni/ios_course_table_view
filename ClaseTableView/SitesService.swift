//
//  SitesService.swift
//  ClaseTableView
//
//  Created by Cristian Leonel Gibert on 27/03/2019.
//  Copyright © 2019 Nicolas Frugoni. All rights reserved.
//

import Foundation

class SitesService {
    weak var delegate: SitesModelProtocol?
    
    init(delegate: SitesModelProtocol) {
        self.delegate = delegate
    }
    
    func getSites() {
        guard let url = URL(string: "https://api.mercadopago.com/sites") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            do {
                let sitesList = try JSONDecoder().decode([Site].self, from: data)
                DispatchQueue.main.async {
                    self?.delegate?.successFetchingSites(sites: sitesList)
                }
            } catch let error {
                print("unable to parse data:\(error)")
            }
        }.resume()
    }
}
