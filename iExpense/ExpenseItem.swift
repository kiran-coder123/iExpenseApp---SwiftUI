//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Kiran Sonne on 23/11/22.
//

import SwiftUI
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

