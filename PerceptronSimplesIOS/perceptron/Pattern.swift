//
//  Pattern.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

struct Pattern {
    var input: [Double]
    var output: Int
    
    init(input: [Double], output: Int) {
        self.input = input
        self.input.insert(-1, at: 0)
        self.output = output
    }
    
    static func *(left: Double, right: Pattern) -> [Double] {
        
        var resultArray: [Double] = []
        
        for inputVariable in right.input {
            resultArray.append(inputVariable * left)
        }
        
        return resultArray
    }
}
