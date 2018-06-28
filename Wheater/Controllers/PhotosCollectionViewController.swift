//
//  PhotosCollectionViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit
import Alamofire

class PhotosCollectionViewController: UICollectionViewController {
    let cellId = "photoCell"
    var friend: Friend?
    var photos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photos = Photo.getPhotos(for: friend!)
        
        // TODO переделать на обычный Dictionary
        let params: Parameters = [
            "album_id": "profile"
        ]
        // запрос к API фото
        try! VKClient.getInstance().getPhotos(parameters: params) { response in
            print(response.value!)
        }
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotosCollectionViewCell
    
        cell.photoImage?.image = UIImage(named: photos[indexPath.row])
    
        return cell
    }

}
