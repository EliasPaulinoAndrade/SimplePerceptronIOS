//
//  ComposedPerceptronTrainner.swift
//  SimplePerceptron
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct ComposedPerceptronTrainner {
    
    var simplePerceptronTrainners: [SimplePerceptronTrainner]
    
    public init(patterns: [[Pattern]], numberOfEpochs: Int) {
        
        simplePerceptronTrainners = []
        for modelPatterns in patterns {
            let simplePerceptronTrainner = SimplePerceptronTrainner.init(
                patterns: modelPatterns,
                numberOfEpochs: numberOfEpochs
            )
            
            simplePerceptronTrainners.append(simplePerceptronTrainner)
        }
    }
    
    public func train() -> ComposedModel {
        
        var composedModel = ComposedModel.init()
        
        for simpleTrainner in simplePerceptronTrainners {
           
            composedModel.addModel(simpleTrainner.train())
        }
        
        return composedModel
    }
}
