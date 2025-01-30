//
//  ContentView.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [AssignmentItem(course: "English", description: "Shakespeare Narrative", dueDate: Date()), AssignmentItem(course: "Physcology", description: "Two-Factor Theory Discussion", dueDate: Date()), AssignmentItem(course: "Calculus", description: "Related Rates Quiz", dueDate: Date()), AssignmentItem(course: "History", description: "Ottoman Empire Essay", dueDate: Date()), AssignmentItem(course: "Chemistry", description: "Periodic Table", dueDate: Date()), AssignmentItem(course: "Computer Science", description: "Assignment Notebook", dueDate: Date())]
    var body: some View {
        NavigationView{
            List {
                ForEach(assignmentItems) { item in
                    HStack {
                    VStack(alignment: .leading, content: {
                        Text(item.course).font(.headline)
                        Text(item.description)
                    })
                        Spacer()
                        Text(item.dueDate, style: .date)
                }
                }
                .onMove(perform: { indices, newOffset in assignmentItems.move(fromOffsets: indices, toOffset: newOffset)})
                .onDelete(perform: { indexSet in assignmentItems.remove(atOffsets: indexSet)})
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            
        }
    }
}

#Preview {
    ContentView()
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
