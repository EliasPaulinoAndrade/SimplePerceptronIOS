//
//  Array+slice.swift
//  SimplePerceptron
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

extension Array {
    func slice(sliceRate: Double) -> (slice1: Array, slice2: Array) {
        let firstSliceCount = Int(Double(self.count) * sliceRate)
        
        let firstSlice = self[0..<firstSliceCount]
        
        let secondSlice = self[firstSliceCount..<self.count]
        
        return (Array(firstSlice), Array(secondSlice))
    }
}
