//
//  TripTopViewCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/9.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class TripTopViewCell: UICollectionViewCell {
  static let reuseID = "TripTopViewCell"
    
    var delegate: TripDelegate?
    var indexPath: IndexPath?
    var index: Int?
    var trip: Travel? {
        didSet{
            
            print("in trip top cell's var trips")
            
            guard let trip = trip else {return}
            titleLabel.text = trip.tripName
            imageView.image = trip.image
            
            let locationAttributedText = NSMutableAttributedString(string: "📍" + trip.location.country + ", " + trip.location.city,
                                                                   attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                                                NSAttributedString.Key.foregroundColor: UIColor.gray])
            locationLabel.attributedText = locationAttributedText
            
            let costAttributedText = NSMutableAttributedString(string: "TWD ",
                                                               attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10),
                                                                            NSAttributedString.Key.foregroundColor: UIColor.gray,
                                                                            NSAttributedString.Key.baselineOffset: 3])
            
            
            
            let anotherCostAttributedText = NSMutableAttributedString(string: "\(trip.cost)",
                attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
                             NSAttributedString.Key.foregroundColor: UIColor.lightBlue])
            costAttributedText.append(anotherCostAttributedText)
            costLabel.attributedText = costAttributedText
            
            if trip.isFavorited {
                
                favoriteButton.setImage(UIImage(named:"icons8-filledRed_like"), for: .normal)
                favoriteButton.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                
            } else {
                favoriteButton.setImage(UIImage(named:"icons8-filled_like"), for: .normal)
                
            }

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget()
        setup()
//        createObserver()
    }
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.frame = .zero
        view.layer.borderColor = UIColor.grayishColor
        view.layer.borderWidth = 1
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
        let reviewStar = NSMutableAttributedString(string: "★★★★★", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightBlue])
        
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
    
    let favoriteButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 22
        btn.layer.masksToBounds = true
        btn.backgroundColor = .white
        btn.setImage(UIImage(named: "icons8-filled_like"), for: .normal)

        return btn
    }()

    func setup() {
        self.contentView.addSubview(bgView)
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
        
        self.addSubview(favoriteButton)
        
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
    
    fileprivate func addTarget() {
        favoriteButton.addTarget(self, action: #selector(likeThis), for: .touchUpInside)
    }
    
    @objc func likeThis() {
        if let indexPath = indexPath {
            delegate?.favoriteThis(index: indexPath)
        }
    }
    
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(like(notification:)), name: .buttonRadio, object: nil)
    }
    
    @objc func like(notification: Notification) {
        guard let index = notification.userInfo?[NotificationKey.liked] as? Int else { return  }
        guard let selfIndex = self.index else { return }
        if selfIndex == index {
//            self.isFavorited.toggle()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

