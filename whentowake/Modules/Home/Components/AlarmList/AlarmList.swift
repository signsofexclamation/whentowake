import SwiftUI

struct AlarmList: View {
    private let alarmOptions: [AlarmOption]
    
    init(for date: Date) {
        self.alarmOptions = AlarmOption.options(for: date)
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            ForEach(self.alarmOptions) { option in
                AlarmOptionRow(option: option)
            }
        }
    }
}
