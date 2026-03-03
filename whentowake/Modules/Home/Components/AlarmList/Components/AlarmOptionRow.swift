import SwiftUI

struct AlarmOptionRow: View {
    private let alarmOption: AlarmOption
    
    init(option: AlarmOption) {
        self.alarmOption = option
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12.0) {
            Text(self.alarmOption.date.time)
                .font(.timesNewRoman(size: timeSize))
                .foregroundStyle(.primary)
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(self.alarmOption.sleep.description)
                    .font(.timesNewRoman(size: 18.0))
                    .foregroundStyle(.primary)
                
                Text(self.alarmOption.sleep.details)
                    .font(.timesNewRoman(size: 14.0))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var timeSize: CGFloat {
        let base: CGFloat = 48.0
        let step: CGFloat = 8.0
        let cycles: CGFloat = CGFloat(self.alarmOption.sleep.cycles)
        let minCycles: CGFloat = 4.0
        
        return base + (step * (cycles - minCycles))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlarmOptionRow(option: .init(date: .now, sleep: .medium))
}
