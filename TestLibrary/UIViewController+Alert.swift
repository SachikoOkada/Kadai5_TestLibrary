//
//  UIViewController+Alert.swift
//  TestLibrary
//
//  Created by Sachiko OKADA on 2019/06/10.
//  Copyright © 2019 Sachiko. All rights reserved.
//

import UIKit

extension UIViewController {
    func singleAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK",
                                        style:  .default,
                                        handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
