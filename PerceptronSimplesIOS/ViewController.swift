//
//  ViewController.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var manager = PercepetronManager()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (trainInput, testInput) = manager.sliceInput()
        
        let trainPatterns: [Pattern] = Array.init(withPatternMatrix: trainInput)
       
        let testPatterns: [Pattern] = Array.init(withPatternMatrix: testInput)
        
        let trainner = SimplePerceptronTrainner.init(patterns: trainPatterns, numberOfEpochs: 100)
        
        let model = trainner.train(numberOfInputs: 4)
        
        for testPattern in testPatterns {
            let modelOutput = model.output(forPattern: testPattern)
            print(modelOutput == testPattern.output ? "Equal" : "Wrong", modelOutput, testPattern.output)
        }
    }
}

