import Foundation

struct Sleep: Identifiable, Hashable {
    let cycles: Int
    let duration: Int
    let description: String
    let details: String
    
    var id: Int {
        return self.hashValue
    }
    
    init(cycles: Int, description: String) {
        self.cycles = cycles
        self.duration = cycles * 90
        self.description = description
        self.details = "\(cycles.spelled) sleep cycles. \(Double(self.duration) / 60.0) hrs of sleep."
    }
}

extension Sleep {
    static var minimal: Sleep {
        return .init(cycles: 4, description: "short")
    }
    
    static var medium: Sleep {
        return .init(cycles: 5, description: "balanced")
    }
    
    static var best: Sleep {
        return .init(cycles: 6, description: "full")
    }
}
