//
//  TripTopViewCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/9.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class TripTopViewCell: UICollectionViewCell {
    var delegate: TripDelegate?
    
    static let reuseID = "TripTopViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    
    lazy var width = frame.width
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.frame = .zero
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        return lbl
    }()
    
    let locationLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let costLabel: UILabel = {
        let lbl = UILabel()
        lbl.sizeToFit()
        lbl.textAlignment = .right
        return lbl
    }()
    
    let reviewLabel: UILabel = {
        let lbl = UILabel()
        lbl.sizeToFit()
        let reviewNum = NSMutableAttributedString(string: "(23)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        let reviewStar = NSMutableAttributedString(string: "★★★★★", attributes: [NSAttributedString.Key.foregroundColor: lightBlue])
        
        reviewStar.append(reviewNum)
        lbl.attributedText = reviewStar
        
        return lbl
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    
    //FIXME:--- BUTTON TO BE FIXED ---
    var isFavorited: Bool = false
    var indexPath: IndexPath?
    
    var favoriteButton = UIButton(type: UIButton.ButtonType.infoDark) {
        didSet {
        }
    }
    
//    let favoriteButton: UIButton = {
//        let btn = UIButton()
//        btn.layer.cornerRadius = 22
//        btn.layer.masksToBounds = true
//        btn.backgroundColor = .white
//        btn.setImage(UIImage(named: "heart blank"), for: .normal)
//        btn.addTarget(TripTopViewCell.self, action: #selector(favoriteThis), for: .touchUpInside)
//        btn.isEnabled = true
//        btn.isUserInteractionEnabled = true
//
//        return btn
//    }()
    
    @objc func favoriteThis() {
        print("CCC")
        isFavorited = !isFavorited
        let image = isFavorited ? UIImage(named: "heart filled") : UIImage(named: "heart blank")
        favoriteButton.setImage(image, for: .normal)
        print("CCC")
    }
    
//    func buttonDidTap(sender: UIButton) {
//
//        print("Assdkslfjkdslfj")
//        if let indexPath = indexPath {
//            delegate?.favoriteThis(index: indexPath)
//        }
//    }
    
    func updateCellBy(trip: Travel) {
        self.imageView.image = trip.image
        self.titleLabel.text = trip.tripName
        //self.favoriteButton.isFavorited = trip.isFavorited
        
        //location AT
        let locationAttributedText = NSMutableAttributedString(string: "📍" + trip.location.country + ", " + trip.location.city,
                                                               attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                                            NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.locationLabel.attributedText = locationAttributedText
        
        //cost AT
        let costAttributedText = NSMutableAttributedString(string: "TWD ",
                                                           attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.gray,
                                                                        NSAttributedString.Key.baselineOffset: 3])
        
        
        
        let anotherCostAttributedText = NSMutableAttributedString(string: "\(trip.cost)",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
                         NSAttributedString.Key.foregroundColor: lightBlue,])
        costAttributedText.append(anotherCostAttributedText)
        self.costLabel.attributedText = costAttributedText
        
        
        
    }
    
    
    func setup() {
        self.contentView.addSubview(bgView)
        //            addSubview(bgView)
        bgView.addSubview(imageView)
        bgView.setAnchor(top: topAnchor,
                         left: leftAnchor, leading: nil,
                         bottom: bottomAnchor,
                         right: rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        imageView.setAnchor(top: bgView.topAnchor,
                            left: bgView.leftAnchor,
                            leading: nil,
                            bottom: nil,
                            right: bgView.rightAnchor,
                            trailing: nil,
                            paddingTop: 0,
                            paddingLeft: 0,
                            paddingBottom: 0,
                            paddingRight: 0,
                            height: 200
            
            
        )
        
        
        let tripNameStackView = UIStackView(arrangedSubviews: [titleLabel, locationLabel])
        bgView.addSubview(tripNameStackView)
        tripNameStackView.axis = .vertical
        tripNameStackView.distribution = .fillEqually
        
        tripNameStackView.spacing = 20
        tripNameStackView.setAnchor(top: imageView.bottomAnchor,
                                    left: bgView.leftAnchor,
                                    leading: nil,
                                    bottom: nil,
                                    right: bgView.rightAnchor,
                                    trailing: nil ,
                                    paddingTop: 8,
                                    paddingLeft: 8,
                                    paddingBottom:0,// 8,
            paddingRight: 8,
            height: 60
        )
        
        
        let reviewCostStackview = UIStackView(arrangedSubviews: [reviewLabel, costLabel])
        bgView.addSubview(reviewCostStackview)
        reviewCostStackview.axis = .horizontal
        reviewCostStackview.alignment =  .trailing
        reviewCostStackview.distribution = .fillEqually
        
        reviewCostStackview.setAnchor(top: tripNameStackView.bottomAnchor, left: bgView.leftAnchor, leading: nil, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
        
        imageView.addSubview(favoriteButton)
        
        favoriteButton.setAnchor(top: imageView.topAnchor,
                                 left: nil,
                                 leading: nil,
                                 bottom: nil,
                                 right: imageView.rightAnchor,
                                 trailing: nil,
                                 paddingTop: 8,
                                 paddingLeft: 0,
                                 paddingBottom: 0,
                                 paddingRight: 8,
                                 width: 44 ,
                                 height: 44)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
