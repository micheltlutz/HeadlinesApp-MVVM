//
//  SourceViewModel.swift
//  HeadlinesApp
//
//  Created by Michel Anderson Lutz Teixeira on 28/02/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class SourceViewModel{
    var id :String
    var name :String
    var description :String
    
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description
    }
    
    init(source: Source){
        id = source.id
        name = source.name
        description = source.description
    }
}
