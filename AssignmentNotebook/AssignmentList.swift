//
//  AssignmentList.swift
//  AssignmentNotebook
//
//  Created by Tessa Murray on 1/30/25.
//
import SwiftUI

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "English", description: "Shakespeare Narrative", dueDate: Date()), AssignmentItem(course: "Psychology", description: "Two-Factor Theory Discussion", dueDate: Date()), AssignmentItem(course: "Calculus", description: "Related Rates Quiz", dueDate: Date()), AssignmentItem(course: "History", description: "Ottoman Empire Essay", dueDate: Date()), AssignmentItem(course: "Chemistry", description: "Periodic Table", dueDate: Date()), AssignmentItem(course: "Computer Science", description: "Assignment Notebook", dueDate: Date())]
}
