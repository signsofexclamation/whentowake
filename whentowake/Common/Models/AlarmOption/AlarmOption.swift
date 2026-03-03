import Foundation

struct AlarmOption: Identifiable, Hashable {
    let id: UUID
    let date: Date
    let sleep: Sleep
    
    init(date: Date, sleep: Sleep) {
        self.id = UUID()
        self.date = date
        self.sleep = sleep
    }
}

extension AlarmOption {
    static func options(for date: Date) -> [AlarmOption] {
        let sleepStartDate = date.adding(.minute, value: 15) ?? (date + 15 * 60)
        let sleepOptions: [Sleep] = [.minimal, .medium, .best]
        
        var alarmOptions: [AlarmOption] = []
        
        for sleep in sleepOptions {
            let wakeupDate = sleepStartDate.adding(.minute, value: sleep.duration) ?? sleepStartDate + TimeInterval(sleep.duration * 60)
            alarmOptions.append(.init(date: wakeupDate, sleep: sleep))
        }
        
        return alarmOptions
    }
}
