//
//  HeadlinesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/16/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class HeadlinesTableViewController : UITableViewController {
    
    var sourceViewModel: SourceViewModel!
    private var headlineListViewModel: HeadlineListViewModel!
    
    private var headlines :[Headline] = [Headline]()
    var source :Source!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        
        self.title = self.sourceViewModel.name
        
        headlineListViewModel = HeadlineListViewModel(sourceViewModel: sourceViewModel){
            self.tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if headlineListViewModel != nil {
            return headlineListViewModel.headlineViewModels.count
        }
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HeadlineTableViewCell
        
        let headlineViewModel = headlineListViewModel.headlineAt(index: indexPath.row)
        
        cell.titleLabel.text = headlineViewModel.title
        cell.descriptionLabel.text = headlineViewModel.description
        
        return cell
    }
    
}
