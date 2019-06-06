//
//  ViewController.swift
//  TestLibrary
//
//  Created by Sachiko OKADA on 2019/06/06.
//  Copyright © 2019 Sachiko. All rights reserved.
//

import UIKit
import Jelly

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
    
    
//    @IBAction func FadeInPresentationCustom(_ sender: Any) {
//
//        let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondView")
//        let presentation = JellyFadeInPresentation(dismissCurve: .easeInEaseOut,
//                                                   presentationCurve: .easeIn,
//                                                   cornerRadius: 6,
//                                                   backgroundStyle: .blur(effectStyle: .light),
//                                                   duration: .medium,
//                                                   widthForViewController: .fullscreen,
//                                                   heightForViewController: .halfscreen,
//                                                   marginGuards: .zero,
//                                                   corners: .allCorners)
//        jellyAnimator = JellyAnimator(presentation: presentation)
//        jellyAnimator?.prepare(presentedViewController: viewController!)
//        present(viewController!, animated: true, completion: nil)
//
//
//    }
    
    
}

