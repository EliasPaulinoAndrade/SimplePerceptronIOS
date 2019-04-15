//
//  SimplePerceptronTrainner.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct SimplePerceptronTrainner {
    
    var rate: Double = 0.5
    var numberOfEpochs: Int
    var patterns: [Pattern]
    
    init(patterns: [Pattern], numberOfEpochs: Int) {
        
        self.numberOfEpochs = numberOfEpochs
        self.patterns = patterns
    }
    
    func train(numberOfInputs: Int) -> Model {
        
        var model = Model.init(withNumberOfInputs: numberOfInputs)
        
        var errorHappend = false
        
        for _ in 0..<numberOfEpochs {
            errorHappend = false
            for pattern in patterns {
                let modelOutput = model.output(forPattern: pattern)
                let waitedOutput = pattern.output
                
                let outputError = waitedOutput - modelOutput
                
                if outputError != 0 {
                    errorHappend = true
                    
                    if let newWeights = vectorSum(vector1: Double(outputError) * rate * pattern, vector2: model.weights) {
                        model.weights = newWeights
                    }
                }
            }
            
            if !errorHappend {
                break
            }
        }
        
        return model
    }
    
    func vectorSum(vector1: [Double], vector2: [Double]) -> [Double]? {
        guard vector1.count == vector2.count else {
            return nil
        }
        
        var resultVector: [Double] = []
        
        for index in 0..<vector1.count {
            resultVector.append(vector1[index] + vector2[index])
        }
        
        return resultVector
    }
}
