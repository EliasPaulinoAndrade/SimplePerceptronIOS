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
        
        let (train, _) = helper.slicedIrisDataLines()
        
        let setosaTrainPatterns = helper.loadIrisDataForSetosa(withDataLines: train)
        let versicolorTrainPatterns = helper.loadIrisDataForVersicolor(withDataLines: train)
        let virginicaTrainPatterns = helper.loadIrisDataForVirginica(withDataLines: train)
        
        let trainner = ComposedPerceptronTrainner.init(
            patterns: [setosaTrainPatterns, versicolorTrainPatterns, virginicaTrainPatterns],
            numberOfEpochs: 100
        )

        let composedModel = trainner.train()
        
        
        
//        let (setosaTrainPatterns, setosaTestPatterns) = helper.loadIrisDataForSetosa()
//        let (versicolorTrainPatterns, versicolorTestPatterns) = helper.loadIrisDataForVersicolor()
//        let (virginicaTrainPatterns, virginicaTestPatterns) = helper.loadIrisDataForVirginica()
//
//        let trainner = ComposedPerceptronTrainner.init(
//            patterns: [setosaTrainPatterns, versicolorTrainPatterns, virginicaTrainPatterns],
//            numberOfEpochs: 100
//        )
//
//        let composedModel = trainner.train()
        
    
//        let trainner = SimplePerceptronTrainner(
//            patterns: trainPatterns,
//            numberOfEpochs: 100
//        )
//
//        let model = trainner.train()
//
//        let tester = SimplePerceptronTester()
//
//        print(
//            tester.predictPercentual(
//                forResults: tester.test(
//                    model: model,
//                    withPatterns: testPatterns
//                )
//            )
//        )
    }
}

