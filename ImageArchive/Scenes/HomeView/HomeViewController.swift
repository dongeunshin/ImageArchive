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
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as! CollectionViewCell
        cell.indexLabel.text = "번째"
        return cell
  }
}
