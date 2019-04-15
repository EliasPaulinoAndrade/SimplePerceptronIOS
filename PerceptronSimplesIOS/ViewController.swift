//
//  ViewController.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataManager = DataManager()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (trainPatterns, testPatterns) = dataManager.sliceInput()
        
        let trainner = SimplePerceptronTrainner(
            patterns: trainPatterns,
            numberOfInputs: 4,
            numberOfEpochs: 100
        )
        
        let model = trainner.train()
        
        let tester = SimplePerceptronTester()
        
        print(
            tester.predictPercentual(
                forResults: tester.test(
                    model: model,
                    withPatterns: testPatterns
                )
            )
        )
    }
}

