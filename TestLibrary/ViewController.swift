//
//  ViewController.swift
//  TestLibrary
//
//  Created by Sachiko OKADA on 2019/06/06.
//  Copyright © 2019 Sachiko. All rights reserved.
//

import UIKit
import Jelly
import FirebaseAuth

var jellyAnimator: JellyAnimator?


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    @IBAction func didTapButton(_ sender: Any) {

        let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondView")
        let presentation = JellyFadeInPresentation()
        jellyAnimator = JellyAnimator(presentation: presentation)
        jellyAnimator?.prepare(presentedViewController: viewController!)
        present(viewController!, animated: true, completion: nil)

    }
    
    @IBAction func didTapSlideButton(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondView")
        let presentation = SlidePresentation(direction: .left)
        jellyAnimator = JellyAnimator(presentation: presentation)
        jellyAnimator?.prepare(presentedViewController: viewController!)
        present(viewController!, animated: true, completion: nil)
    
    }
    
    @IBAction func logoutTappedBtn(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier:
                "LoginViewController")
            let appDelegate = AppDelegate.shared
            appDelegate.window?.rootViewController = loginVC
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    

    
}

