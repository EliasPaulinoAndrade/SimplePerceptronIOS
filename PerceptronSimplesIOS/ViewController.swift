//
//  ViewController.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit
import SimplePerceptron

class ViewController: UIViewController {

    var helper = PerceptronHelper.init()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (trainPatterns, testPatterns) = helper.loadIrisData()
        
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

