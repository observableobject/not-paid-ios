import SwiftUI

public struct NotPaid: ViewModifier {
    
    @EnvironmentObject var settings: NotPaidSettings
    
    public func body(content: Content) -> some View {
        content.opacity(settings.opacityScalar).onAppear() {
            setFactor()
        }
    }
    
    private func setFactor() {
        if !settings.isActive {
            let now = Date()
            let endDate = settings.dueDate.addingTimeInterval(TimeInterval((settings.deadline * 86400)))
            if settings.dueDate < now {
                let opacityScalar = endDate.timeIntervalSinceNow / endDate.timeIntervalSince(settings.dueDate)
                settings.opacityScalar = now < endDate ? opacityScalar : 0.0
            }
        }
    }
}

public class NotPaidSettings: ObservableObject {

    @Published var dueDate: Date
    @Published var deadline: Int
    @Published var opacityScalar: Double = 1.0
    @Published var isActive: Bool = false
    
    public init(dueDate: Date, deadline: Int = 60){
        self.dueDate = dueDate
        self.deadline = deadline
    }
}

extension View {
    public func notPaid() -> some View {
        modifier(NotPaid())
    }
}

