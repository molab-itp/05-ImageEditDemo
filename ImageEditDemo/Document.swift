//
//  Model.swift
//

import Foundation

// Array of image url strings
let imageArray = [
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/dan-osullivan1.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/alumni/ari_headshot.jpg.preset.square.jpeg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/GabePattern5.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/Sarah-Rothberg.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/clay-shirky.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/GeneralPics/katherinedillon.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/alumni/pedro.galvao.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/Luisa-Pereira.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/alumni/raaziq-brown.jpg.preset.square.jpeg?",
    "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_4491.JPEG",
    "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7555.JPEG",
]

class Document: ObservableObject {
    @Published var items:[ItemModel]
    init() {
        print("Model init")
        // items for testing
        items = [
            // ItemModel(urlStr: imageArray[0], label:"Dan O"),
            // ItemModel(urlStr: imageArray[1], label:"Ari"),
            // ItemModel(urlStr: imageArray[2], label:"Gabe"),
            // ItemModel(urlStr: imageArray[3], label:"Sarah"),
            // ItemModel(urlStr: imageArray[4], label:"Clay"),
            // ItemModel(urlStr: imageArray[5], label:"Katherine"),
            // ItemModel(urlStr: imageArray[6], label:"Pedro"),
            // ItemModel(urlStr: imageArray[7], label:"Luisa"),
            // ItemModel(urlStr: imageArray[8], label:"Raaziq"),
            ItemModel(urlStr: imageArray[9], label:"jht1", assetName: "red", systemName: "rectangle"),
            ItemModel(urlStr: imageArray[10], label:"jht2", assetName: "yellow"),
            ItemModel(urlStr: imageArray[0], label:"dan", systemName: "circle"),
        ]
    }
    
    func addItem(urlStr:String, label:String, assetName:String, systemName: String) -> ItemModel {
        let item = ItemModel(urlStr:urlStr, label:label, assetName: assetName, systemName: systemName)
        items.append(item)
        return item
    }
    
    func newItem() -> ItemModel {
        return addItem(urlStr: "", label: "", assetName: "", systemName: "")
    }
    
    func updateItem(id: UUID, urlStr:String, label:String, assetName:String, systemName: String) {
        if let index = findIndex(id) {
            items[index].urlStr = urlStr
            items[index].label = label
            items[index].assetName = assetName
            items[index].systemName = systemName
        }
    }
    
    func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
}
