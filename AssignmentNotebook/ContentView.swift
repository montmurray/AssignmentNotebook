//
//  ContentView.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
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
            .sheet(isPresented: $showingAddItemView, content: { AddItemView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { showingAddItemView = true}, label: {Image(systemName: "plus")
            }))
            
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
