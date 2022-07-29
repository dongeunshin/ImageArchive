//
//  HomeViewController.swift
//  ImageArchive
//
//  Created by dong eun shin on 2022/07/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var imageList: [ImageEntity] = []

    @IBOutlet weak var HomeCollectionView: UICollectionView!
    
    @IBAction func tapStarBttn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            return
        }else{
            sender.isSelected = true
        }
        let alert = UIAlertController(
            title: "⚠️",
            message: "⚡️메세지가 이미지와 함께 저장됩니다.⚡️",
            preferredStyle: .alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: .default) { (ok) in
                ImageManager.shared.saveImage(image: UIImage(systemName: "heart")!, name: "tmp")
                let a = ImageManager.shared.getSavedImage(named: "tmp")
                print(">>>>", a)
//                DataManager.shared.createItem(name: "", path: "", url: "", message: "") {
//                    print("Saved Item")
//                }
            
        }
        let cancel = UIAlertAction(
            title: "cancel",
            style: .cancel
        ) { (cancel) in
            if sender.isSelected {
                sender.isSelected = false
            }else{
                sender.isSelected = true
            }
        }
        alert.addTextField { (myTextField) in
            myTextField.placeholder = "여기에 메세지를 입력해 주세요."
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let networkService: Api = NetworkService()
        networkService.request { result in
            switch result {
            case .success(let data):
                self.imageList = data as! [ImageEntity]
                DispatchQueue.main.sync {
                    self.HomeCollectionView.reloadData()
                }
            case .failure(let error):
                print("ERROR: ", error)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as! CollectionViewCell
        cell.indexLabel.text = "\(indexPath.row + 1)번째"
        let info = imageList[indexPath.row]
        let urlString = info.imageURL.thumbnail
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            DispatchQueue.main.sync {
                cell.imageView.image = UIImage(data: data)
            }
        }.resume()
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
