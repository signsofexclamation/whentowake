import Foundation

extension Int {
    var spelled: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(for: self) ?? ""
    }
}
