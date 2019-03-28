//
//  ViewController.swift
//  ClaseTableView
//
//  Created by Nicolas Frugoni on 3/21/19.
//  Copyright © 2019 Nicolas Frugoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SiteViewControllerProtocol {
    
    var siteList = [Site]()
    var siteModel: SitesModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mi App"
        siteModel = SitesModel(delegate: self)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .always
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        siteModel?.getAllSites()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibCell = UINib.init(nibName: String(describing: CustomTableViewCell.self), bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "mycell")
    }
    
    func reloadTableView(sites: [Site]) {
        siteList = sites
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        let site = siteList[indexPath.row]
        cell.textLabel?.text = "\(site.id)"
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = DetailViewController(site: siteList[indexPath.row])
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
