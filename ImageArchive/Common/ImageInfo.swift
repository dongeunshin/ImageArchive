//
//  ImageInfo.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/29.
//

import Foundation


struct imageInfo: Codable {
    let infoList: [info]
}

// MARK: - review
struct info: Codable {
    var imageURL: String
    var likes: Int
    var width: Int
    var height: Int
}
