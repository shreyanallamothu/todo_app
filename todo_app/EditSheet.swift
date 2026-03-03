//
//  EditSheet.swift
//  todo_app
//
//  Created by shreya nallamothu on 3/3/26.
//

//
//  ContentView.swift
//  todo_app
//
//  Created by shreya nallamothu on 3/3/26.
//

import SwiftUI

struct EditSheet: View {
    @Binding var selectedColor: Color
    @Binding var title: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "list.bullet.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
            TextField("List Title", text: $title)
                .font(.system(size: 30)).bold()
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    
    @Previewable @State var title = "list"
    
    EditSheet(selectedColor: $selectedColor, title: $title)
}
