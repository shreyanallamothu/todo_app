//
//  ContentView.swift
//  todo_app
//
//  Created by shreya nallamothu on 3/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(title: "Shreya's To-Do List", items: [], color: .blue)
    @State private var newReminder: String = ""
    @State private var showTextField = false
    
    var body: some View {
        VStack {
            HStack{
                Text(page.title)
                    .font(.system(size: 30)).bold()
                    .foregroundStyle(page.color)
                Spacer()
                Button{
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle").foregroundStyle(page.color)
                }
            }
            List {
                ForEach($page.items) { $reminder in
                    Toggle(isOn: $reminder.isCompleted){
                        HStack{
                            Text(reminder.title)
                            Spacer()
                            Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "checkmark.circle" )
                        }
                    }.tint(page.color)
                        .listRowSeparator(.hidden)
                        .toggleStyle(.button)
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
                }
            }
        }
        .padding(20)
        .sheet(isPresented: $isEditing) {
            EditSheet(selectedColor: $page.color, title: $page.title)
        
        }
    }
}

#Preview {
    ContentView()
}
