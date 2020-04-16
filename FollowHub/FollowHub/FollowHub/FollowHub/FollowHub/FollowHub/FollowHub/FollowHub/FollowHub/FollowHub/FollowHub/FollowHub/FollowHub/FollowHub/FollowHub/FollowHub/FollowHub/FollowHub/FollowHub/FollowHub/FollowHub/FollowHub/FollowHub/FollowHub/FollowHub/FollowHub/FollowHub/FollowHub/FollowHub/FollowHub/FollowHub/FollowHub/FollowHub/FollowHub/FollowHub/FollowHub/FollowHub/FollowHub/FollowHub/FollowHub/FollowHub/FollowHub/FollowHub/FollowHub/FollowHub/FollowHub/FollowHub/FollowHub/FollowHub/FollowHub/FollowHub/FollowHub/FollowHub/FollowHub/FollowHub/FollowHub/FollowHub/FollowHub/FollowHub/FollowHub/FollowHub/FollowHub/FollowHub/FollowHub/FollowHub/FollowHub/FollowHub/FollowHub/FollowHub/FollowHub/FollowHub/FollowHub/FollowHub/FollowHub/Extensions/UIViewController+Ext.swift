//
//  UIViewController+Ext.swift
//  FollowHub
//
//  Created by Dan T on 16/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

extension UIViewController {
    
  func presentFHAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = FHAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
