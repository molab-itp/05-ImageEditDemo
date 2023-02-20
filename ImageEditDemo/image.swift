//
//  image.swift
//

import SwiftUI

// Read in an image from the array of url strings
func imageFor( index: Int) -> UIImage {
  let urlStr = imageArray[index % imageArray.count]
  return imageFor(string: urlStr)
}

// Read in an image from a url string
func imageFor(string str: String) -> UIImage! {
  guard let url = URL(string: str),
        let imgData = try? Data(contentsOf: url),
        let uiImage = UIImage(data:imgData)
  else {
    return nil
  }
  return uiImage
}

