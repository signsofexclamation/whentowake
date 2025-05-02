//
//  Sleep.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import Foundation

struct Sleep: Identifiable, Hashable {
    let cycles: Int
    let info: String
    let duration: Int
    
    var id: Int {
        return self.hashValue
    }
    
    init(cycles: Int, info: String) {
        self.cycles = cycles
        self.info = info
        self.duration = cycles * 90
    }
}

extension Sleep {
    static var minimal: Sleep {
        return .init(cycles: 4, info: "minimal")
    }
    
    static var medium: Sleep {
        return .init(cycles: 5, info: "medium")
    }
    
    static var best: Sleep {
        return .init(cycles: 6, info: "best")
    }
}
