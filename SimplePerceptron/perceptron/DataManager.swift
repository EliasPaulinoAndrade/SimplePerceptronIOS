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
        inBundle bundle: Bundle = Bundle.main) -> Array<Substring> {
        
        guard let irisPath = bundle.path(forResource: fileName, ofType: nil),
              let fileString = try? String.init(contentsOfFile: irisPath) else {
                
            return []
        }
        
        let fileLines = fileString.split(separator: "\n")
        
        return fileLines
    }
    
    func mapPatternsData(dataStringLines: Array<Substring>, completion: ([Substring]) -> Pattern) -> [Pattern]? {
        
        var patterns: [Pattern] = []
        
        for line in dataStringLines {
            let lineVariables = line.split(separator: ",")
            
            let pattern = completion(lineVariables)
            
            patterns.append(pattern)
        }
        
        return patterns
    }
    
    public mutating func slicePatterns(_ patterns: [Pattern]) -> (train: [Pattern], test: [Pattern]) {

        var suffPatterns = patterns.shuffled()
        
        let trainSliceCount = Int(Double(suffPatterns.count) * 0.8)
        
        let trainSlice = suffPatterns[0..<trainSliceCount]
        
        let testSlice = suffPatterns[trainSliceCount..<suffPatterns.count]
        
        return (Array(trainSlice), Array(testSlice))
    }
}
