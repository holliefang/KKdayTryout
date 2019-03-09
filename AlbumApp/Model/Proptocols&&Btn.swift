//
//  File.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/8.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

protocol TripDelegate {
    func update(trip: Travel)
    func favoriteThis(index: IndexPath)
}

protocol ButtonDelegate {
    func buttonClicked(bool: Bool)
}

class MyButton: UIButton {

    var isFavorited: Bool = false
    var delegate: ButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(clickButton), for: .touchUpInside)

        buttonInit(bool: isFavorited)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buttonInit(bool: isFavorited)

    }

    func buttonInit(bool: Bool){
    }

    @objc func clickButton(){
        changeImage(bool: !isFavorited)
    }

    func changeImage(bool: Bool){
        print("Click")
        isFavorited = bool
        let image = bool ? UIImage(named: "heart filled") : UIImage(named: "heart blank")
        setImage(image, for: .normal)
    }


}
