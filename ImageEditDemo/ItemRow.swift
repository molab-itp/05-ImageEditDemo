//
//  ItemRow.swift
//

import SwiftUI


struct ItemRow: View {
  var item:ItemModel
  var body: some View {
    HStack {
      ZStack {
        Image(item.assetName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width:100, height: 100)
        if let uiImage = imageFor(string: item.urlStr) {
          Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height: 100)
        }
        Image(systemName: item.systemName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width:100, height: 100)
      }
      Text(item.label)
      Spacer()
    }
  }
}


