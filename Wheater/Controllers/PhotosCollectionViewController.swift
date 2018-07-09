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
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        guard friend != nil else {
            return
        }
        
        // запрос к API фото
        try! VKClient.getInstance().getPhotos(for: friend!) { photos in
            let realm = try! Realm()
            try! realm.write {
                realm.delete(realm.objects(Photo.self).filter("friend.id = %@", self.friend!.id))
                realm.add(photos)
                
                self.loadDataFromRealm()
            }
        }
    }
    
    private func loadDataFromRealm() {
        let realm = try! Realm()
        self.photos = realm.objects(Photo.self).filter("friend.id = %@", self.friend!.id).map { $0 }
        self.collectionView?.reloadData()
    }
}
