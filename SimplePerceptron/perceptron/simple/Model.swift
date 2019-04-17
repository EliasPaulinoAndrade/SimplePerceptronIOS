import Foundation

public struct Model {
    
    var weights: [Double]
    
    init(withNumberOfInputs numberOfInputs: Int) {
        
        weights = Array.init(withSize: numberOfInputs, randomRange: 0.0 ..< 1.0)
        
    }
    
    func activation(forPattern pattern: Pattern) -> Double {
        guard weights.count == pattern.input.count else {
            return -1
        }
        
        var activation = 0.0
        
        for index in 0..<weights.count {
            activation += weights[index] * pattern.input[index]
        }
        
        return activation
    }
    
    func output(forPattern pattern: Pattern) -> PredictionResult {
        let activationValue = activation(forPattern: pattern)
        
        guard activationValue != -1 else {
            return PredictionResult(activation: activationValue, output: -1)
        }
        
        return PredictionResult(activation: activationValue, output: activationValue > 0 ? 1 : 0)
    }
}
