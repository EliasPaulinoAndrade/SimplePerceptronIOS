//
//  IrisType.swift
//  PerceptronSimplesIOS
//
//  Created by Elias Paulino on 16/04/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

enum IrisType: String, CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
    
    var identifier: Int {
        switch self {
        case .setosa:
            return 0
        case .versicolor:
            return 1
        case .virginica:
            return 2
        }
    }
    
    case setosa = "Iris-setosa", versicolor = "Iris-versicolor", virginica = "Iris-virginica"
}
