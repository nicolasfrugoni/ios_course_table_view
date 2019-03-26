//
//  DetailViewController.swift
//  ClaseTableView
//
//  Created by Jonatan Urquiza on 3/26/19.
//  Copyright © 2019 Nicolas Frugoni. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var site: Site!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init(site: Site) {
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
        self.site = site
        self.title = "Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idLabel.text = site.id
        detailLabel.text = site.name
    }

}
