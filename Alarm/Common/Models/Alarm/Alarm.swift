import AlarmKit

extension Alarm {
    static var all: [Alarm] {
        return (try? AlarmManager.shared.alarms) ?? []
    }
    
    static func schedule(option: AlarmOption) async throws -> Alarm {
        let alert: AlarmPresentation = AlarmPresentation(
            alert: .init(
                title: "wake up",
                stopButton: AlarmButton(
                    text: "stop",
                    textColor: .primary,
                    systemImageName: "stop"
                )
            )
        )
        
        let attributes: AlarmAttributes<EmptyAlarmMetadata> = .init(
            presentation: alert,
            tintColor: .primary
        )
        
        return try await AlarmManager.shared.schedule(
            id: option.id,
            configuration: .alarm(
                schedule: .fixed(option.date),
                attributes: attributes
            )
        )
    }
    
    func cancel() throws {
        try AlarmManager.shared.cancel(id: self.id)
    }
}
