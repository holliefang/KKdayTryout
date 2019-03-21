//
//  CoverHeaderCollectionReusableView.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/10.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class CoverHeaderCollectionReusableView: UICollectionReusableView {
    
    static let cellId = "headerCell"

    var trip: Travel?
    var images: [UIImage] = [] {
        didSet{
//            guard let trip = trip else {return}
            pageControl.numberOfPages = images.count
        }
    }
    
    let customImageView: UIImageView = {
    let iv = UIImageView()
//    iv.image = #imageLiteral(resourceName: "album9")
    iv.contentMode = .scaleAspectFill
    return iv
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.pageIndicatorTintColor = .white
        pc.currentPageIndicatorTintColor = UIColor.lightBlue
        pc.backgroundColor = .clear
//        pc.contentMode = .scaleAspectFill
//        pc.numberOfPages = 3
        return pc
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
        
        addSubview(customImageView)
        addSubview(pageControl)
        pageControl.setAnchor(top: nil, left: leftAnchor, leading: nil, bottom: bottomAnchor, right: rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 30)
        customImageView.fillSuperview()
        customImageView.clipsToBounds = true
        
        pgCtrlAdd()
    }
    
    func pgCtrlAdd() {
        pageControl.addTarget(self, action: #selector(self.nextImage), for: .valueChanged)
    }
    
    @objc func nextImage() {
        customImageView.image = images[pageControl.currentPage]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
