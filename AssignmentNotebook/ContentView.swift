//
//  ContentView.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    var body: some View {
        NavigationView{
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                    VStack(alignment: .leading, content: {
                        Text(item.course).font(.headline)
                        Text(item.description)
                    })
                        Spacer()
                        Text(item.dueDate, style: .date)
                }
                }
                .onMove(perform: { indices, newOffset in assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)})
                .onDelete(perform: { indexSet in assignmentList.items.remove(atOffsets: indexSet)})
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
