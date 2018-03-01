//
//  HeadlineViewModel.swift
//  HeadlinesApp
//
//  Created by Michel Anderson Lutz Teixeira on 01/03/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class HeadlineViewModel {
    
    var title :String
    var description :String
    
    init(title: String, description: String){
        self.title = title
        self.description = description
    }
    
    init (headline: Headline){
        title = headline.title
        description = headline.description
    }
}
