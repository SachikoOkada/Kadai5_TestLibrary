//
//  LoginViewController.swift
//  TestLibrary
//
//  Created by Sachiko OKADA on 2019/06/10.
//  Copyright © 2019 Sachiko. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpTappedBtn(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let password = passTextField.text else { return }
        if email.isEmpty {
            self.singleAlert(title: "エラー", message: "メールアドレスを⼊⼒して下さい")
            return
        }
        if password.isEmpty {
            self.singleAlert(title: "エラー", message: "パスワードを⼊⼒して下さい")
            return
        }
        self.emailSignUp(email: email, password: password)
    }
    
    
    @IBAction func signInTappedBtn(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let password = passTextField.text else { return }
        if email.isEmpty {
            self.singleAlert(title: "エラー", message: "メールアドレスを⼊⼒して下さい")
            return
        }
        if password.isEmpty {
            self.singleAlert(title: "エラー", message: "パスワードを⼊⼒して下さい")
            return
        }
        self.emailSignIn(email: email, password: password)
    }
    
    func emailSignUp (email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let _error = error {
                self.signUpErrAlert(_error)
            } else {
                self.presentViewController()
            }
        }
    }
    
    func emailSignIn (email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let _error = error {
                self.signInErrAlert(_error)
            } else {
                self.presentViewController()
            }
        }
    }
    
    func signUpErrAlert(_ error: Error){
        if let errCode = AuthErrorCode(rawValue: error._code) {
            var message = ""
            switch errCode {
            case .invalidEmail:      message =  "有効なメールアドレスを入力してください"
            case .emailAlreadyInUse: message = "既に登録されているメールアドレスです"
            case .weakPassword:      message = "パスワードは６文字以上で入力してください"
            default:                 message = "エラー: \(error.localizedDescription)"
            }
            self.singleAlert(title: "登録できません", message: message)
        }
    }
    
    func signInErrAlert(_ error: Error){
        if let errCode = AuthErrorCode(rawValue: error._code) {
            var message = ""
            switch errCode {
            case .userNotFound:  message = "アカウントが見つかりませんでした"
            case .wrongPassword: message = "パスワードを確認してください"
            case .userDisabled:  message = "アカウントが無効になっています"
            case .invalidEmail:  message = "Eメールが無効な形式です"
            default:             message = "エラー: \(error.localizedDescription)"
            }
            self.singleAlert(title: "ログインできません", message: message)
        }
    }
    
    func presentViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Navi = storyboard.instantiateViewController(withIdentifier: "NavigationController")
        self.present(Navi, animated: true, completion: nil)
    }
    
    @IBAction func termsTappedBtn(_ sender: Any) {
    }
    
    
}
