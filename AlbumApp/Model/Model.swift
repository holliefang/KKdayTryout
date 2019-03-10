//
//  Model.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/4.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import Foundation
import UIKit

let lightBlue = UIColor(red: 126/255, green: 190/255, blue: 232/255, alpha: 1)
let grayishColor = UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 0.3).cgColor

var customText = ""


struct Travel {
    var tripName: String
    var location: Location
    var cost: Int
    var image: UIImage? = nil
    var isFavorited: Bool = false

}

struct Location {
    var country: String
    var city: String
    var image: UIImage? = nil
}


let sectionArray = ["Recently viewd", "Popular destinations", "Staff-Picked", "Around current location"]

var trips = [hawaiiTrip, tokyoDisney, mtFujiTrip, sydneyTrip, thailandTrip]


let hawaiiTrip = Travel(tripName: "Day Tour from Waikiki: Kualoa Ranch - Jurassic Park Adventure", location: Location(country: "United States", city: "Hawaii", image: #imageLiteral(resourceName: "album9")), cost: 5616, image: #imageLiteral(resourceName: "album3"), isFavorited: false)

let tokyoDisney = Travel(tripName: "Disneyland 1 day tick", location: Location(country: "Japan", city: "Tokyo", image: #imageLiteral(resourceName: "album7")), cost: 2094, image: #imageLiteral(resourceName: "album1"), isFavorited: false)

let mtFujiTrip = Travel(tripName: "Petronas Tower sightseeing", location: Location(country: "Malaysia", city: "Kuala Lumpur", image: #imageLiteral(resourceName: "image5")), cost: 1490, image: #imageLiteral(resourceName: "album5"), isFavorited: false)

let sydneyTrip = Travel(tripName: "Sydney Trip", location: Location(country: "Australia", city: "Sydney", image: #imageLiteral(resourceName: "image4")), cost: 10839, image: #imageLiteral(resourceName: "image4"), isFavorited: false)

let thailandTrip = Travel(tripName: "Thailand Trip", location: Location(country: "Thailand", city: "Bangkog", image: #imageLiteral(resourceName: "album8")), cost: 1849, image: #imageLiteral(resourceName: "album4"), isFavorited: false)

