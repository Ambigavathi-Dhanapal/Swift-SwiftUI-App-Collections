//
//  ContentView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

//import SwiftUI
////import SwiftData
//
//struct ContentView: View {
////    @Environment(\.modelContext) private var modelContext
////    @Query private var items: [Item]
//
//    var body: some View {
//
//        NavigationSplitView {
//            List {
//                HomeListView()
////                ForEach(items) { item in
////                    NavigationLink {
////                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
////                    } label: {
////                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
////                    }
////                }
////                .onDelete(perform: deleteItems)
////            }
////            .toolbar {
////                ToolbarItem(placement: .navigationBarTrailing) {
////                    EditButton()
////                }
////                ToolbarItem {
////                    Button(action: addItem) {
////                        Label("Add Item", systemImage: "plus")
////                    }
////                }
////            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

import SwiftUI
struct ContentView: View {
    var body: some View {
        HomeListView()
    }
}
#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
