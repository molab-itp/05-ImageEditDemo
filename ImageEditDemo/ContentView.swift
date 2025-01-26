//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @Environment(Document.self) var document
    
    var body: some View {
        NavigationView {
            List {
                // Display in reverse order to see new additions first
                ForEach(document.items.reversed()) { item in
                    NavigationLink(
                        destination:
                        // ItemDetail(item: item)
                        // UpdateImageView(item: item)
                        UpdateImageView(action: "Update",
                                        id: item.id,
                                        urlStr: item.urlStr,
                                        label: item.label,
                                        assetName: item.assetName,
                                        systemName: item.systemName)
                    )
                    {
                        ItemRow(item: item)
                    }
                }
            }
            .navigationTitle("My Items")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination:
                            AddImageView()
                    )
                {
                    Text("Add Item")
                }
            )
        }
    }
}

#Preview {
    ContentView()
        .environment(Document())
}
