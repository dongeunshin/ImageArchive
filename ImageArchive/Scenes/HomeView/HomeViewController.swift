//
//  HomeViewController.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var HomeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let networkService: Api = NetworkService()
        networkService.request { result in
            print(result)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as! CollectionViewCell
        cell.indexLabel.text = "번째"
        cell.backgroundColor = .brown
        return cell
  }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            let itemsPerRow: CGFloat = 2
            let widthPadding = 2 * (itemsPerRow + 1)
            let itemsPerColumn: CGFloat = 3
            let heightPadding = 2 * (itemsPerColumn + 1)
            let cellWidth = (width - widthPadding) / itemsPerRow
            let cellHeight = (height - heightPadding) / itemsPerColumn
            
            return CGSize(width: cellWidth, height: cellHeight)
            
        }
}
