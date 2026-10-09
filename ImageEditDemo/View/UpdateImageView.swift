//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
  var action: String // "Update" or "Add"
  var id: UUID
  
  @State var urlStr:String = ""
  @State var label:String = ""
  @State var assetName:String = ""
  @State var systemName:String = ""
    
  @Environment(\.dismiss) var dismiss
  @Environment(Document.self) var document
  
  var body: some View {
    VStack {
      ZStack {
        Image(assetName)
          .resizable()
          .aspectRatio(contentMode: .fit)
        AsyncImage(url: URL(string: urlStr)) { phase in
          if let image = phase.image {
            image // Displays the loaded image.
              .resizable()
              .aspectRatio(contentMode: .fit)
            // .frame(width:100, height: 100)
          } else if phase.error != nil {
            Color.red // Indicates an error.
          } else {
            Color.clear // Acts as a placeholder.
          }
        }
        Image(systemName: systemName)
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
      HStack {
        Button("Update") {
          print("UpdateImageView Update")
          document.updateItem(id: id, urlStr: urlStr,
                              label: label,
                              assetName: assetName,
                              systemName: systemName)
          dismiss()
        }
        Spacer()
        Button("Delete") {
          document.deleteItem(id: id)
          dismiss();
        }
      }.padding(10)
      Form {
        TextField("url", text: $urlStr)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("label", text: $label)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("assetName", text: $assetName)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("systemName", text: $systemName)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
      }
    }
  }
}

#Preview {
  UpdateImageView(action: "action", id: UUID())
    .environment(Document())
}
