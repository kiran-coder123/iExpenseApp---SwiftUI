//
//  AddView.swift
//  iExpense
//
//  Created by Kiran Sonne on 23/11/22.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "personal"
    @State private var  amount = 0.0
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    let types = ["Business","Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField(name, text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                }
                 
                TextField("Amount",value: $amount, format: .currency(code:Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
               
            }
            .navigationTitle("Add New Expenses")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
