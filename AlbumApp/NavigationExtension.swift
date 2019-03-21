//
//  NavigationExtension.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/15.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
