//
//  VkAuthViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 28.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit
import WebKit

class VkAuthViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        loadLoginPage()
    }
    
    private func loadLoginPage() {
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=6618823&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,groups,photos&response_type=token&v=5.52")
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
}

extension VkAuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map({ $0.components(separatedBy: "=")})
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        if let token = params["access_token"] {
            print(token)
            VKClient.token = token
            
            performSegue(withIdentifier: "AfterLoginSegue", sender: self)
        }
        
        decisionHandler(.cancel)
    }
}
