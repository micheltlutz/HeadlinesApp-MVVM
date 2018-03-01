//
//  SourcesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/8/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class SourcesTableViewController : UITableViewController {
    
    private var webservice: Webservice!
    private var sourceListViewModel: SourceListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webservice = Webservice()
        sourceListViewModel = SourceListViewModel(webservice: webservice){
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceListViewModel.sourcesViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SourceTableViewCell
        
        let source = self.sourceListViewModel.sourceAt(index: indexPath.row)
        cell.titleLabel.text = source.name
        cell.descriptionLabel.text = source.description
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let headlinesTVC = segue.destination as? HeadlinesTableViewController else {
            fatalError("HeadlinesTableViewController not found")
        }
        let indexPath = (self.tableView.indexPathForSelectedRow)!
        let sourceViewModel = self.sourceListViewModel.sourceAt(index: indexPath.row)
        headlinesTVC.sourceViewModel = sourceViewModel
    }
}
