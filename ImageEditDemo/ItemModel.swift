//
//  Item.swift
//

import Foundation

struct ItemModel : Identifiable {
    let id = UUID()
    var urlStr:String = ""
    var label:String = ""
    var assetName:String = ""
    var systemName:String = ""
}

