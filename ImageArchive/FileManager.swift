//
//  FileManager.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/26.
//

import Foundation

//class FileManager {
//    static let shared = ImageManager()
//
//        func saveImage(image: UIImage) -> Bool {
//            guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
//                return false
//            }
//            guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
//                return false
//            }
//            do {
//                try data.write(to: directory.appendingPathComponent("profile.png")!)
//                return true
//            } catch {
//                print(error.localizedDescription)
//                return false
//            }
//        }
//
//        func getSavedImage(named: String) -> UIImage? {
//            if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
//                return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
//            }
//            return nil
//        }
//}
