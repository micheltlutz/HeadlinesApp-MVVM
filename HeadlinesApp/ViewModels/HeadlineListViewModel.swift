//
//  HeadlineListViewModel.swift
//  HeadlinesApp
//
//  Created by Michel Anderson Lutz Teixeira on 01/03/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation


class HeadlineListViewModel {
    
    private (set) var headlineViewModels: [HeadlineViewModel] = [HeadlineViewModel]()
    
    init(sourceViewModel: SourceViewModel, completion: @escaping () -> ()){
        
        let source = Source(sourceViewModel: sourceViewModel)
        
        Webservice().loadHeadLinesForSource(source: source) { headlines in
            self.headlineViewModels = headlines.map(HeadlineViewModel.init)
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func headlineAt(index: Int) -> HeadlineViewModel {
        return headlineViewModels[index]
    }
}
