//
//  AddItemView.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/30/25.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode; static let courses = ["English", "Psychology", "Calculus", "History", "Chemistry", "Computer Science"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in Text(course)
                    }
                }
            }
        }
    }
}

#Preview {
    AddItemView(assignmentList: AssignmentList())
}
