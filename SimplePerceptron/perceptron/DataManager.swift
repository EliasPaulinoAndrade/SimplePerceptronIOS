//
//  PercepetronManager.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct DataManager {
    
    public init() {}
    
    public func loadPatternsFromFile(
        withName fileName: String,
        inBundle bundle: Bundle = Bundle.main,
        completion: ([Substring]) -> Pattern) -> [Pattern]? {
        
        let patternsData = loadDataLinesFromFile(withName: fileName)
        return mapPatternsData(dataStringLines: patternsData, completion: completion)
    }
    
    public func loadDataLinesFromFile(
        withName fileName: String,
        inBundle bundle: Bundle = Bundle.main) -> [Substring] {
        
        guard let irisPath = bundle.path(forResource: fileName, ofType: nil),
              let fileString = try? String.init(contentsOfFile: irisPath) else {
                
            return []
        }
        
        let fileLines = fileString.split(separator: "\n")
        
        return fileLines
    }
    
    public func mapPatternsData(dataStringLines: Array<Substring>, completion: ([Substring]) -> Pattern) -> [Pattern]? {
        
        var patterns: [Pattern] = []
        
        for line in dataStringLines {
            let lineVariables = line.split(separator: ",")
            
            let pattern = completion(lineVariables)
            
            patterns.append(pattern)
        }
        
        return patterns
    }
    
    public func slicePatterns<T>(_ patterns: [T]) -> (train: [T], test: [T]) {

        let suffPatterns = patterns.shuffled()

        let (trainSlice, testSlice) = suffPatterns.slice(sliceRate: 0.8)
        
        return (trainSlice, testSlice)
    }
}
