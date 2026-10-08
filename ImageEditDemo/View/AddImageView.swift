//
//  AddImageView.swift
//

import SwiftUI
import PhotosUI

struct AddImageView: View {
  @State var urlStr:String = ""
  @State var label:String = ""
  @State var assetName:String = ""
  @State var systemName:String = ""
  
  //    @State var uiImage:UIImage?
  
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
        Button("Add") {
          print("AddImageView Add")
          let _ = document.addItem(
            urlStr: urlStr,
            label: label,
            assetName: assetName,
            systemName: systemName)
          dismiss()
        }
        Spacer()
        Button("Cancel") {
          print("AddImageView Cancel")
          dismiss()
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
    //        .task {
    //            uiImage =  await imageFor(string: urlStr)
    //        }
  }
}

#Preview {
  AddImageView()
    .environment(Document())
}

