//
//  dictionaryViewController.swift
//  TalkingSigns
//
//  Created by Archit Khanna on 26/02/23.
//

import UIKit

class signsViewController: UIViewController, UISearchResultsUpdating {
    
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    }
}
