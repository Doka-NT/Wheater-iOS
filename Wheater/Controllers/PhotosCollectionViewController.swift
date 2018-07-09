//
//  PhotosCollectionViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import RealmSwift

class PhotosCollectionViewController: UICollectionViewController {
    let cellId = "photoCell"
    var friend: Friend?
    var photos: Results<Photo>!
    
    private let repo = CommonRepository<Photo>()
    private var token:NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromRealm()
        loadData()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotosCollectionViewCell
    
        let url = URL(string: photos[indexPath.row].uri)
        
        cell.photoImage?.kf.setImage(with: url)
    
        return cell
    }

    private func loadData() {
        // запрос к API фото
        try! VKClient.getInstance().getPhotos(for: friend!) { self.repo.saveAll($0, for:self.friend!) }
    }
    
    private func loadDataFromRealm() {
        photos = repo.all(for:friend!)
        
        token = photos.observe { changes in
            switch changes {
            case .initial(_):
                self.collectionView?.reloadData()
            case .update(_):
                self.collectionView?.reloadData()
            case .error(let error):
                print (error)
            }
        }
    }
}
