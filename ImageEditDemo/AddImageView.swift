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
                Button("Add") {
                    print("AddImageView Add")
                    let _ = document.addItem(urlStr: urlStr, label: label,
                                             assetName: assetName, systemName: systemName)
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
        .task {
            uiImage =  await imageFor(string: urlStr)
        }
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}

