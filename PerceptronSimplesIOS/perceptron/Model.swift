import Foundation

struct Model {
    
    var weights: [Double]
    
    init(withNumberOfInputs numberOfInputs: Int) {
        
        weights = Array.init(withSize: numberOfInputs + 1, randomRange: 0.0 ..< 1.0)
        
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
    
    func output(forPattern pattern: Pattern) -> Int {
        let activationValue = activation(forPattern: pattern)
        
        guard activationValue != -1 else {
            return -1
        }
        
        return activationValue > 0 ? 1 : 0
    }
}
