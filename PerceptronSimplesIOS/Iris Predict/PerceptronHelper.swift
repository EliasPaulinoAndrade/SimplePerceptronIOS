//
//  PerceptronManager.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation
import SimplePerceptron

class PerceptronHelper {
    var dataManager = DataManager()
    
    func slicedIrisDataLines() -> (train: [Substring], test: [Substring]) {
        
        let irisDataLines = dataManager.loadDataLinesFromFile(withName: "irisData")
        
        return dataManager.slicePatterns(irisDataLines)
    }
    
    func loadIrisPatterns(forIrisType irisType: IrisType, withDataLines dataLines: [Substring]) -> [Pattern] {
        
        let patternsMapCompletion = { (columns: [Substring]) -> Pattern in
            var lineVariables = columns

            let outputStringValue = lineVariables.removeLast()
            var outputValue: Int

            let inputValues = lineVariables.compactMap {
                return Double($0)
            }

            if outputStringValue == "\(irisType)" {
                outputValue = 0
            } else {
                outputValue = 1
            }

            let pattern = Pattern.init(input: inputValues, output: outputValue)

            return pattern
        }
        
        guard let patterns = dataManager.mapPatternsData(
            dataStringLines: dataLines,
            completion: patternsMapCompletion) else {
                
            return []
        }
        
        return patterns
    }
    
    func loadIrisPatterns(withDataLines dataLines: [Substring]) -> [Pattern] {
        let patternsMapCompletion = { (columns: [Substring]) -> Pattern in
            var lineVariables = columns
            
            let outputStringValue = lineVariables.removeLast()
            var outputValue: Int
            
            let inputValues = lineVariables.compactMap {
                return Double($0)
            }
            
            if let irisType = IrisType(rawValue: String(outputStringValue)) {
                outputValue = irisType.identifier
            } else {
                outputValue = -1
            }
            
            let pattern = Pattern.init(input: inputValues, output: outputValue)
            
            return pattern
        }
        
        guard let patterns = dataManager.mapPatternsData(
            dataStringLines: dataLines,
            completion: patternsMapCompletion) else {
                
                return []
        }
        
        return patterns
    }
}
