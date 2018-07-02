//
//  VKClient.swift
//  Wheater
//
//  Created by Артем Сошников on 28.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import Alamofire

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
    
    func getFriends(handler:@escaping (DataResponse<Any>) -> Void) {
        callApi(method: "friends.get", parameters: ["fields": "nickname,photo_200"], handler: handler)
    }
    
    func getPhotos(parameters: Parameters, handler:@escaping (DataResponse<Any>) -> Void) {
        callApi(method: "photos.get", parameters: parameters, handler: handler)
    }
    
    func getGroups(handler:@escaping (DataResponse<Any>) -> Void) {
        callApi(method: "groups.get", parameters: nil, handler: handler)
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
        print(url, params)
        Alamofire.request(url, method: .get, parameters: params).responseJSON(completionHandler: handler)
    }
    
    private func checkToken() throws {
        if (VKClient.token == "") {
            throw VKError.noToken
        }
    }
}
