//
//  ComposedPerceptronTrainner.swift
//  SimplePerceptron
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct ComposedPerceptronTrainner {
    
    var simplePerceptronTrainners: [(trainner: SimplePerceptronTrainner, identifier: Int)]
    
    public init(patterns: [(trainnerPatterns: [Pattern], identifier: Int)], numberOfEpochs: Int) {
        
        simplePerceptronTrainners = []
        for modelPatterns in patterns {
            let simplePerceptronTrainner = SimplePerceptronTrainner.init(
                patterns: modelPatterns.trainnerPatterns,
                numberOfEpochs: numberOfEpochs
            )
            
            simplePerceptronTrainners.append((simplePerceptronTrainner, modelPatterns.identifier))
        }
    }
    
    public func train() -> ComposedModel {
        
        var composedModel = ComposedModel.init()
        
        for simpleTrainner in simplePerceptronTrainners {
           
            composedModel.addModel(simpleTrainner.trainner.train(), withID: simpleTrainner.identifier)
        }
        
        return composedModel
    }
}
