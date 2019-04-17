//
//  ComposedPerceptronTester.swift
//  SimplePerceptron
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

public struct ComposedPerceptronTester {
    
    public init() {}
    
    public func test(model: ComposedModel, withPatterns patterns: [Pattern]) -> [Bool] {
        
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
    
    public func test(trainPatterns: [(trainnerPatterns: [Pattern], identifier: Int)], testPatterns: [Pattern], numberOfEpochs: Int, numberOfRealizations: Int) -> [Double] {
        
        var percentuals: [Double] = []
        
        for _ in 0..<numberOfRealizations {
            let trainner = ComposedPerceptronTrainner.init(
                patterns: suffle(trainPatterns: trainPatterns),
                numberOfEpochs: numberOfEpochs
            )
            
            let composedModel = trainner.train()
            
            let tester = ComposedPerceptronTester.init()
            
            let correctPercentual = tester.predictPercentual(forResults: tester.test(model: composedModel, withPatterns: testPatterns.shuffled())).correct
            
            percentuals.append(correctPercentual)
        }
        
        return percentuals
    }
    
    public func variation(forPercentuals percentuals: [Double]) -> (variation: Double, average: Double) {
        let percentualSum = percentuals.reduce(0) { (currentSum, currentValue) -> Double in
            return currentSum + currentValue
        }
        
        let percentualAverage = percentualSum / Double(percentuals.count)
        
        var variation = 0.0
        
        for percentual in percentuals {
            variation += pow(percentual - percentualAverage, 2)
        }
        
        return (sqrt(variation / Double(percentuals.count)), percentualAverage)
    }
    
    private func suffle(trainPatterns: [(trainnerPatterns: [Pattern], identifier: Int)]) -> [(trainnerPatterns: [Pattern], identifier: Int)] {
        
        var suffledTrainnerPatterns: [(trainnerPatterns: [Pattern], identifier: Int)] = []
        
        for pattern in trainPatterns {
            let suffledPatterns = pattern.trainnerPatterns.shuffled()
            
            let suffledPatternsWrapper = (trainnerPatterns: suffledPatterns, identifier: pattern.identifier)
            
            suffledTrainnerPatterns.append(suffledPatternsWrapper)
        }
        
        return suffledTrainnerPatterns
    }
}
