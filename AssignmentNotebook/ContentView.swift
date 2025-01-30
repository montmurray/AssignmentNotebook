//
//  ContentView.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var stuff = ["Un", "Dex", "Trois", "Quatre", "Cinq"]
    var body: some View {
        NavigationView{
            List {
                ForEach(stuff, id: \.self) { assignment in
                    Text(assignment)
                }
                .onMove(perform: { indices, newOffset in stuff.move(fromOffsets: indices, toOffset: newOffset)})
                .onDelete(perform: { indexSet in stuff.remove(atOffsets: indexSet)})
            }
            .navigationBarTitle("Assignments", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            
        }
    }
}

#Preview {
    ContentView()
}
