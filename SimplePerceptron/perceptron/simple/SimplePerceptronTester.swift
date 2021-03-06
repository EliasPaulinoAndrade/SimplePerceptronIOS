//
//  SimplePerceptronTester.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct SimplePerceptronTester {
    
    public init() {}
    
    public func test(model: Model, withPatterns patterns: [Pattern]) -> [Bool] {
        
        var testResults: [Bool] = []
        
        for testPattern in patterns {
            let modelOutput = model.output(forPattern: testPattern)
            
            modelOutput.output == testPattern.output ?
                testResults.append(true) : testResults.append(false)
        }
        
        return testResults
    }
    
    public func predictPercentual(forResults results: [Bool]) -> (correct: Double, wrong: Double) {
        let total = results.count
        let correctResults = results.reduce(0) { (currentSum, result) -> Int in
            return result ? currentSum + 1 : currentSum
        }
        let wrongResults = total - correctResults
        
        let correntPercentual = Double(correctResults) / Double(total)
        
        let wrongPercentual = Double(wrongResults) / Double(total)
        
        return (correntPercentual, wrongPercentual)
    }
}
