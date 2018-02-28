//
//  SourceListViewModel.swift
//  HeadlinesApp
//
//  Created by Michel Anderson Lutz Teixeira on 28/02/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class SourceListViewModel {
    
    private var webservice: Webservice
    private (set) var sourcesViewModel: [SourceViewModel] = [SourceViewModel]()
    private var completion: () -> () = { }
    
    init(webservice: Webservice, completion: @escaping () -> ()) {
        self.webservice = webservice
        self.completion = completion
        populateSources()
    }
    
    func populateSources(){
        webservice.loadSources{ sources in
            self.sourcesViewModel = sources.map(SourceViewModel.init)
            self.completion()
        }
    }
    
    func sourceAt(index: Int) -> SourceViewModel {
        return sourcesViewModel[index]
    }
}
