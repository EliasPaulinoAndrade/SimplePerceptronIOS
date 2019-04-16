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
    
    func loadIrisData() -> (train: [Pattern], test: [Pattern]) {
        guard let patterns = dataManager.loadPatternsFromFile(withName: "irisData", inBundle: Bundle.main, completion: { columns in
            
            var lineVariables = columns
            
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
            
            return pattern
        }) else {
            
            return ([], [])
        }
        
        return dataManager.slicePatterns(patterns)
    }
}
