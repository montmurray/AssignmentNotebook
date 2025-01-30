//
//  AssignmentList.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/30/25.
//
import SwiftUI

class AssignmentList: ObservableObject {
    @Published var items : [AssignmentItem] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "data")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try? JSONDecoder().decode([AssignmentItem].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
}
   // }(course: "English", description: "Shakespeare Narrative", dueDate: Date()), AssignmentItem(course: "Psychology", description: "Two-Factor Theory Discussion", dueDate: Date()), AssignmentItem(course: "Calculus", description: "Related Rates Quiz", dueDate: Date()), AssignmentItem(course: "History", description: "Ottoman Empire Essay", dueDate: Date()), AssignmentItem(course: "Chemistry", description: "Periodic Table", dueDate: Date()), AssignmentItem(course: "Computer Science", description: "Assignment Notebook", dueDate: Date())]
