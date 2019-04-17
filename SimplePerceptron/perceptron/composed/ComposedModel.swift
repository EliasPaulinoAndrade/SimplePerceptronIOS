//
//  ComposedModel.swift
//  SimplePerceptron
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct ComposedModel {
    var models: [(model: Model, identifier: Int)] = []
    
    mutating func addModel(_ model: Model, withID id: Int) {
        models.append((model: model, identifier: id))
    }
    
    func output(forPattern pattern: Pattern) -> PredictionResult {
        
        var simpleModelResults: [(result: PredictionResult, identifier: Int)] = []
        
        for simpleModel in models {
            simpleModelResults.append((
                result: simpleModel.model.output(forPattern: pattern),
                identifier: simpleModel.identifier
            ))
        }
        
        let sortedModelResults = simpleModelResults.sorted { (result1, result2) -> Bool in
            return result1.result.activation > result2.result.activation
        }
        
        for resultIndex in 0..<sortedModelResults.count {
            let currentResult = sortedModelResults[resultIndex]
            if currentResult.result.output == 0 {
                
                return PredictionResult(activation: currentResult.result.activation, output: currentResult.identifier)
            }
        }
        
        for resultIndex in (0..<sortedModelResults.count).reversed() {
            let currentResult = sortedModelResults[resultIndex]
            if currentResult.result.output == 1 {
                
                return PredictionResult(activation: currentResult.result.activation, output: currentResult.identifier)
            }
        }
        
        return PredictionResult(activation: -1.0, output: -1)
    }
}
