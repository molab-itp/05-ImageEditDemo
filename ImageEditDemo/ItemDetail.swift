//
//  ItemDetail.swift
//

import SwiftUI

struct ItemDetail: View {
    var item:ItemModel

    @State var uiImage:UIImage?

    @EnvironmentObject var document:Document
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack {
            ZStack {
                Image(item.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if let uiImage  {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Image(systemName: item.systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Text("url: ")
                Text(item.urlStr)
                Spacer()
            }
            HStack {
                Text("label: ")
                Text(item.label)
                Spacer()
            }
            HStack {
                Text("assetName: ")
                Text(item.assetName)
                Spacer()
            }
            HStack {
                Text("systemName: ")
                Text(item.systemName)
                Spacer()
            }
            Button("Delete") {
                document.deleteItem(id: item.id)
                dismiss();
            }
        }
        .task {
            uiImage =  await imageFor(string: item.urlStr)
        }
    }
}

