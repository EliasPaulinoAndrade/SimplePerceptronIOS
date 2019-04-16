//
//  Array+initPatterns.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 15/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

extension Array where Element == Pattern {
    init(withPatternMatrix patternMatrix: [[Double]]) {
        self.init()
        
        for patternLine in patternMatrix {
            
            var patternLineInput = patternLine
            let output = patternLineInput.removeLast()
            
            let pattern = Pattern.init(input: patternLineInput, output: Int(output))
            
            append(pattern)
        }
    }
}

