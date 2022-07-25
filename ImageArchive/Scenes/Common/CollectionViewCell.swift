//
//  CollectionViewCell.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var downloadBttn: UIButton!
}
