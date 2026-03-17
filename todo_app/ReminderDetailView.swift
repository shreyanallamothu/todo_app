import SwiftUI

struct ReminderDetailView: View {
    @Binding var reminderTitle: String
    @Binding var reminderDesc: String
    @Binding var reminderDate: Date
    @Binding var page: RemindersPage

    @State private var isEditing: Bool = false

    var body: some View {
        VStack{
            Text(reminderDesc).padding(40)
            Text("Title & Description").foregroundStyle(page.color).bold().italic()
            HStack{
                Text("Title")
                TextField(reminderTitle, text: $reminderTitle)
            }.padding(15).background(Color.white).cornerRadius(30)
            HStack{
                Text("Description")
                TextField(reminderDesc, text: $reminderDesc)
            }.padding(15).background(Color.white).cornerRadius(30)
            Text("Date").foregroundStyle(page.color).bold()
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
            DatePicker("Date", selection: $reminderDate).padding(15).background(Color.white).cornerRadius(30)

                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isEditing = true
                        } label: {
                            Image(systemName: "info.circle").foregroundStyle(
                                page.color
                            )
                        }
                    }
                }.sheet(isPresented: $isEditing) {
                    EditSheet(selectedColor: $page.color, title: $page.title)
                }.navigationTitle(reminderTitle)
                .navigationBarTitleDisplayMode(.inline)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20).background(Color(red: 243/255, green: 243/255, blue: 246/255))
    }
}

#Preview {
    @Previewable @State var title: String = "i have a task"
    @Previewable @State var description: String = "this is it's description"
    @Previewable @State var date: Date = Date()
    @Previewable @State var page = RemindersPage(
        title: "Default Page",
        items: [
            Reminder(
                title: "Buy Milk",
                description: "Get 2% milk",
                date: Date()
            ),
            Reminder(
                title: "Pick up eggs",
                description: "Organic large eggs",
                date: Date()
            ),
        ],
        color: .blue
    )

    NavigationStack {
        ReminderDetailView(
            reminderTitle: $title,
            reminderDesc: $description,
            reminderDate: $date,
            page: $page
        )
    }
}
