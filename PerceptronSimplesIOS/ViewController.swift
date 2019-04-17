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
        
        let (train, test) = helper.slicedIrisDataLines()
        
        let setosaTrainPatterns = helper.loadIrisPatterns(forIrisType: .setosa, withDataLines: train)
        let versicolorTrainPatterns = helper.loadIrisPatterns(forIrisType: .versicolor, withDataLines: train)
        let virginicaTrainPatterns = helper.loadIrisPatterns(forIrisType: .virginica, withDataLines: train)
        
        let trainner = ComposedPerceptronTrainner.init(
            patterns: [(setosaTrainPatterns, 0), (versicolorTrainPatterns, 1), (virginicaTrainPatterns, 2)],
            numberOfEpochs: 100
        )

        let composedModel = trainner.train()
        
        let tester = ComposedPerceptronTester.init()
        
        let testPatterns = helper.loadIrisPatterns(withDataLines: test)
        
        print(
            tester.predictPercentual(
                forResults: tester.test(
                    model: composedModel,
                    withPatterns: testPatterns
                )
            )
        )
        
        let percentuals = tester.test(trainPatterns: [(setosaTrainPatterns, 0), (versicolorTrainPatterns, 1), (virginicaTrainPatterns, 2)], testPatterns: testPatterns, numberOfEpochs: 100, numberOfRealizations: 20)
        
        print(percentuals)
        print(tester.variation(forPercentuals: percentuals))
    }
}

