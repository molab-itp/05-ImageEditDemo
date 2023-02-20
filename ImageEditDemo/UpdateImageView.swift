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
    
    @State var uiImage:UIImage?
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var document:Document
    
    var body: some View {
        VStack {
            ZStack {
                Image(assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Image(systemName: systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Button("Update") {
                    print("UpdateImageView Update")
                    document.updateItem(id: id, urlStr: urlStr, label: label,
                                        assetName: assetName, systemName: systemName)
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
        .task {
            uiImage =  await imageFor(string: urlStr)
        }
    }
}

struct UpdateImageView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateImageView(action: "action", id: UUID())
    }
}
