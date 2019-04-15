import Foundation

extension Array where Element == Double {
    init(withSize size: Int, randomRange: Range<Double>) {
        self.init()
        
        for _ in 0..<size {
            append(Double.random(in: randomRange))
        }
    }
}
