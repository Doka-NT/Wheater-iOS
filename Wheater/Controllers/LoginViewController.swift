//
//  ViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 14.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        userNameField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    

    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        
        scrollView?.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        scrollView?.endEditing(true)
    }
    
    fileprivate func doAuth() {
        var text:String = "Войти не получилось =("
        if userNameField?.text == "admin" && passwordField?.text == "12345" {
            text = "Добро пожаловать, admin!"
        }
        
        let alertController = UIAlertController(
            title: "Авторизация",
            message: text,
            preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(
            UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil)
        )
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        doAuth()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
}

extension LoginViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == userNameField) {
            passwordField.becomeFirstResponder()
        }
        
        if (textField == passwordField) {
            doAuth()
        }
        
        return true
    }
}
