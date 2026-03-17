//
//  ContentView.swift
//  todo_app
//
//  Created by shreya nallamothu on 3/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(title: "Shreya's To-Do List", items: [], color: .green)
    @State private var newReminder: String = ""
    @State private var showTextField = false
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Text(page.title)
                        .font(.system(size: 30)).bold()
                        .foregroundStyle(page.color)
                    Spacer()
                }
                List {
                    ForEach($page.items) { $reminder in
                        NavigationLink(destination: ReminderDetailView(reminderTitle: $reminder.title, reminderDesc: $reminder.description, reminderDate: $reminder.date, page: $page))
                        {Toggle(isOn: $reminder.isCompleted){
                            HStack{
                                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "checkmark.circle" )
                                Text(reminder.title)
                                Text(reminder.date, style: .relative)
                                Spacer()
                            }
                        }.tint(page.color)
                                .listRowSeparator(.hidden)
                                .toggleStyle(.button)
                        }
                    }
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                    .foregroundStyle(page.color)
                    if showTextField{
                        VStack{
                            TextField("add a task", text: $newReminder).multilineTextAlignment(.center).onSubmit{
                                page.add_task(task: newReminder)
                                newReminder = ""
                                showTextField = false
                            }
                        }
                    }
                    
                }
                .listStyle(.plain)
                HStack{
                    Spacer()
                    Button {
                        showTextField = true
                    } label: {
                        Image(systemName: "plus.circle.fill").resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(page.color)
                    }
                }
                .toolbar{
                            ToolbarItem(placement: .topBarTrailing){
                                Button{
                                    isEditing = true
                                } label: {
                                    Image(systemName: "info.circle").foregroundStyle(page.color)
                                }
                            }
                        }
            }
            .padding(20)
            .sheet(isPresented: $isEditing) {
                EditSheet(selectedColor: $page.color, title: $page.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
