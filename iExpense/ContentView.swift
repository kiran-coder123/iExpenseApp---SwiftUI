//
//  ContentView.swift
//  iExpense
//
//  Created by Kiran Sonne on 23/11/22.
//

import SwiftUI
 
//class Expenses: ObservableObject {
//    @Published var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//}


struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingExpenses = false
   
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                    Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                     }
                    }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button {
                  showingExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingExpenses){
            AddView(expenses: expenses)
        }
  }
        
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets:offsets)
    }
         
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
