import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
    
    mutating func add_task(task: String){
        var newReminder = Reminder(title: task, isCompleted: false)
        items.append(newReminder)
    }
}
