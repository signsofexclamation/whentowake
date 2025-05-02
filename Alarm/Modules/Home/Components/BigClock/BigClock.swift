//
//  BigClock.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI

struct BigClock: View {
    struct Digit: Identifiable {
        let id: UUID
        let digit: String
        
        init(digit: String) {
            self.id = UUID()
            self.digit = digit
        }
    }
    
    private let digits: [Digit]
    
    init(for date: Date) {
        self.digits = date.time.map { .init(digit: String($0)) }
    }
    
    var body: some View {
        HStack(spacing: 8.0) {
            ForEach(self.digits) { digit in
                Image("Clock/\(digit.digit)")
                    .resizable()
            }
        }
    }
}

#Preview {
    BigClock(for: .now)
}
