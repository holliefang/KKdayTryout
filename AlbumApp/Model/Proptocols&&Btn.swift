//
//  File.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/8.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

protocol TripDelegate {
//    func update(trip: Travel)
    func favoriteThis(index: IndexPath)
    
}

protocol MoveDelegate {
    func move(indexpath: IndexPath)
}

