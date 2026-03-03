import SwiftUI

struct ListItem: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 16.0) {
            Text(self.title)
                .font(.timesNewRoman(size: 16.0))
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.forward")
                .font(.system(size: 14.0))
                .foregroundStyle(.secondary)
        }
        .padding(16.0)
    }
}
