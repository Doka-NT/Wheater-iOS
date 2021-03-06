//
//  VKClient.swift
//  Wheater
//
//  Created by Артем Сошников on 28.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class VKClient {
    
    enum VKError: Error {
        case noToken
    }
    
    static var instance: VKClient?
    static var token = ""
    
    static func getInstance() throws -> VKClient {
        if instance == nil {
            instance = try self.init()
        }
        
        return instance!
    }
    
    let clientId = "6618823"
    let baseUrl = "https://api.vk.com/method/"
    
    private init() throws {
        try checkToken()
    }
    
    func getFriends(handler:@escaping ([Friend]) -> Void) {
        callApi(
            method: "friends.get",
            parameters: ["fields": "nickname,photo_200"]
        ) { response in
            let json = JSON(response.value as Any)
            let friends = ModelFactory.createFriendList(json)
            
            handler(friends)
        }
    }
    
    func getPhotos(for friend:Friend, handler:@escaping ([Photo]) -> Void) {
        callApi(
            method: "photos.get", parameters: [
                "owner_id": friend.id,
                "album_id": "profile"
        ]) { response in
            let json = JSON(response.value as Any)
            let photos = ModelFactory.createPhotosList(json).map { photo -> (Photo) in
                photo.friend = friend
                return photo
            }
            
            handler(photos)
        }
    }
    
    func getGroups(handler:@escaping ([Group]) -> Void) {
        callApi(method: "groups.get", parameters: ["extended": 1]) { response in
            let json = JSON(response.value as Any)
            let groups = ModelFactory.createGroupList(json)
            
            handler(groups)
        }
    }
    
    func searchGroups(pattern:String, handler:@escaping ([Group]) -> Void) {
        callApi(method: "groups.search", parameters: ["q": pattern]) { response in
            let json = JSON(response.value as Any)
            let groups = ModelFactory.createGroupList(json)
            
            handler(groups)
        }
    }
    
    private func callApi(method:String, parameters optParams:Parameters?, handler:@escaping (DataResponse<Any>) -> Void) {
        var params: Parameters = [
            "client_id": clientId,
            "v": "5.52",
            "access_token": VKClient.token,
            ]
        
        if (optParams != nil) {
            params.merge(optParams!, uniquingKeysWith: { (_, last) in last })
        }
        
        let url = baseUrl + method
        Alamofire.request(url, method: .get, parameters: params).responseJSON(completionHandler: handler)
    }
    
    private func checkToken() throws {
        if (VKClient.token == "") {
            throw VKError.noToken
        }
    }
}
