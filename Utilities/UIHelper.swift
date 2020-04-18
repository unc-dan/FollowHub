//
//  UIHelper.swift
//  FollowHub
//
//  Created by Dan T on 18/04/2020.
//  Copyright © 2020 Dan T. All rights reserved.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                        = view.bounds.width
        let padding: CGFloat             = 12
        let minimumItemSpacting: CGFloat = 10
        let availableWidth               = width - (padding * 2) - (minimumItemSpacting * 2)
        let itemWidth                    = availableWidth / 3
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: itemWidth, height: itemWidth + 40) //+40 for a little more height to account for avatar label below avatar
        
        return flowLayout
    }
}
