//
//  Webservice.swift
//  HeadlinesApp
//
//  Created by Michel Anderson Lutz Teixeira on 28/02/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    
    func loadHeadLinesForSource(source: Source, completion: @escaping ([Headline]) -> ()) {
        
        var headLines = [Headline]()
        
        // get the headlines by source
        let url = URL(string :"https://newsapi.org/v2/top-headlines?sources=\(source.id)&apiKey=c83efde0c7b14f978761eed39ea784b8")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                let headlineDictionaries = dictionary["articles"] as! [[String:Any]]
                
                headLines = headlineDictionaries.flatMap(Headline.init)
                
                DispatchQueue.main.async {
                    completion(headLines)
                }
            }
            
            }.resume()
    }
    
    func loadSources(completion:@escaping ([Source]) -> ()) {
        
        var sources = [Source]()
        
        let sourceURL = URL(string :"https://newsapi.org/v2/sources?apiKey=c83efde0c7b14f978761eed39ea784b8")!
        
        URLSession.shared.dataTask(with: sourceURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                let sourcesDictionary = dictionary["sources"] as! [[String:Any]]
                
                sources = sourcesDictionary.flatMap(Source.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            }.resume()
    }
}
