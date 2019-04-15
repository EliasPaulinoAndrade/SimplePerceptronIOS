//
//  PercepetronManager.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct PercepetronManager {
    lazy var irisPatterns: [Pattern]? = {
        guard let irisPath = Bundle.main.path(forResource: "irisData", ofType: nil),
              let fileString = try? String.init(contentsOfFile: irisPath) else {
                
                
            return nil
        }
    
        let fileLines = fileString.split(separator: "\n")
        var patterns: [Pattern] = []
        
        for line in fileLines {
            var lineVariables = line.split(separator: ",")
            let outputStringValue = lineVariables.removeLast()
            var outputValue: Int

            let inputValues = lineVariables.compactMap {
                return Double($0)
            }

            if outputStringValue == "Iris-setosa" {
                outputValue = 0
            } else {
                outputValue = 1
            }

            let pattern = Pattern.init(input: inputValues, output: outputValue)

            patterns.append(pattern)
        }
        
        return patterns
    }()
    
    mutating func sliceInput() -> (train: [Pattern], test: [Pattern]) {
        guard var irisPatterns = self.irisPatterns else {
            return ([], [])
        }
        
        irisPatterns.shuffle()
        
        let trainSliceCount = Int(Double(irisPatterns.count) * 0.8)
        
        let trainSlice = irisPatterns[0..<trainSliceCount]
        
        let testSlice = irisPatterns[trainSliceCount..<irisPatterns.count]
        
        return (Array(trainSlice), Array(testSlice))
    }
}
