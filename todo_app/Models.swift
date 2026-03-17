import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var date: Date
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
    
    mutating func add_task(task: String){
        var newReminder = Reminder(title: task, description: "", date: Date().addingTimeInterval(86400), isCompleted: false)
        items.append(newReminder)
    }
}
