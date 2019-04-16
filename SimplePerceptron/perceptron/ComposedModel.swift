//
//  ComposedModel.swift
//  SimplePerceptron
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct ComposedModel {
    var models: [Model] = []
    
    mutating func addModel(_ model: Model) {
        models.append(model)
    }
    
    func output(forPattern pattern: Pattern) -> Int {
        
        var simpleModelResults: [PredictionResult] = []
        
        for simpleModel in models {
            simpleModelResults.append(simpleModel.output(forPattern: pattern))
        }
        
        let sortedModelResults = simpleModelResults.sorted { (result1, result2) -> Bool in
            return result1.activation > result2.activation
        }
        
        for resultIndex in 0..<sortedModelResults.count {
            if sortedModelResults[resultIndex].output == 1 {
                return resultIndex
            }
        }
        
        return -1
    }
}
