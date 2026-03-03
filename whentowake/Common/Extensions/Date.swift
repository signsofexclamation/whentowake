import Foundation

extension Date {
    var time: String {
        return self.formatted(
            .dateTime
                .hour(.twoDigits(amPM: .omitted))
                .minute(.twoDigits)
        )
    }
    
    var year: String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        
        return String(year)
    }
    
    func adding(_ component: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }
}
