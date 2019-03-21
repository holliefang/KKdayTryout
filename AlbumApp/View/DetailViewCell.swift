//
//  DetailViewCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/9.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class DetailViewCell: UICollectionViewCell {
    static let reuseIdentifier = "Cell"
    fileprivate let stackviewPadding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    var trip: Travel? {
        didSet{
            guard let trip = trip else {return}
            titleLabel.text = trip.tripName
            let locationAttributedText = NSMutableAttributedString(string: "📍" + trip.location.country + ", " + trip.location.city,
                                                                   attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                                                NSAttributedString.Key.foregroundColor: UIColor.gray])
            locationLabel.attributedText = locationAttributedText
            
            //cost AT
            let costAttributedText = NSMutableAttributedString(string: "TWD ",
                                                               attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                                                                            NSAttributedString.Key.foregroundColor: UIColor.gray,
                                                                            NSAttributedString.Key.baselineOffset: 3])
            
            
            
            let anotherCostAttributedText = NSMutableAttributedString(string: "\(trip.cost)",
                attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
                             NSAttributedString.Key.foregroundColor: UIColor.lightBlue,])
            costAttributedText.append(anotherCostAttributedText)
            costLabel.attributedText = costAttributedText
            
            let productAttributedText = NSMutableAttributedString(string: "🏷 Product No. \(trip.detail.productNo)",
                                                                  attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                                               NSAttributedString.Key.foregroundColor: UIColor.gray])
            productNoLabel.attributedText = productAttributedText
            
            let attributedText = NSMutableAttributedString(string: trip.detail.detailInfo, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            descriptionLabel.attributedText = attributedText
        }
    }
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = .zero
        return view
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let locationLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let productNoLabel: UILabel = {
        let lbl = UILabel()
//        lbl.text = "🏷Product No. :19834"
        
        
        let productAttributedText = NSMutableAttributedString(string: "🏷 Product No. :19834",
                                                               attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                                            NSAttributedString.Key.foregroundColor: UIColor.gray])
        lbl.attributedText = productAttributedText
        
        return lbl
    }()
    
    let descriptionLabel: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        let text = """
Take an in-depth tour of the Sydney Opera House with a friendly English or Chinese guide.
Learn its history and enjoy behind-the-scenes glimpses of the performance halls.
Take an in-depth tour of the Sydney Opera House with a friendly English or Chinese guide.
Learn its history and enjoy behind-the-scenes glimpses of the performance halls.
Take an in-depth tour of the Sydney Opera House with a friendly English or Chinese guide.
Learn its history and enjoy behind-the-scenes glimpses of the performance halls.
"""
        
        let attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        tv.attributedText = attributedText

        return tv
    }()

    
    let costLabel: UILabel = {
        let lbl = UILabel()
        lbl.sizeToFit()
        lbl.textAlignment = .left
        return lbl
    }()
    
    let reviewLabel: UILabel = {
        let lbl = UILabel()
        lbl.sizeToFit()
        lbl.textAlignment = .right
        let reviewNum = NSMutableAttributedString(string: "(87)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        let reviewStar = NSMutableAttributedString(string: "★ ★ ★ ★ ★ ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightBlue])
        
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
    
    let lineView: UIView = {
       let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    //FIXME:--- BUTTON TO BE FIXED ---
    var isFavorited: Bool = false
    var indexPath: IndexPath?
    
    let favoriteButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 22
        btn.layer.masksToBounds = true
        btn.backgroundColor = .white
        btn.setImage(UIImage(named: "icons8-filled_like"), for: .normal)
        
        return btn
    }()
    
    @objc func favoriteThis() {
        changeHeart(bool: isFavorited)
    }
    
    func changeHeart(bool: Bool) {
        isFavorited = !isFavorited
    }
    
    
    func updateCellBy(trip: Travel) {
        self.imageView.image = trip.image
        self.titleLabel.text = trip.tripName
        
        //location AT
        let locationAttributedText = NSMutableAttributedString(string: "📍" + trip.location.country + ", " + trip.location.city,
                                                               attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                                            NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.locationLabel.attributedText = locationAttributedText
        
        //cost AT
        let costAttributedText = NSMutableAttributedString(string: "TWD ",
                                                           attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.gray,
                                                                        NSAttributedString.Key.baselineOffset: 3])
        
        
        
        let anotherCostAttributedText = NSMutableAttributedString(string: "\(trip.cost)",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
                         NSAttributedString.Key.foregroundColor: UIColor.lightBlue,])
        costAttributedText.append(anotherCostAttributedText)
        self.costLabel.attributedText = costAttributedText
        
        
        if trip.isFavorited {
            favoriteButton.setImage(UIImage(named:"icons8-filledRed_like"), for: .normal)
            favoriteButton.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            
        } else {
            favoriteButton.setImage(UIImage(named:"icons8-filled_like"), for: .normal)
            
        }
        
    }
    
    
    func setup() {
//        addTarget()
        self.contentView.addSubview(bgView)
        bgView.setAnchor(top: topAnchor,
                         left: leftAnchor, leading: nil,
                         bottom: bottomAnchor,
                         right: rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)

        
        
        
        let tripNameStackView = UIStackView(arrangedSubviews: [titleLabel, locationLabel, productNoLabel])
        bgView.addSubview(tripNameStackView)
        tripNameStackView.axis = .vertical
        tripNameStackView.distribution = .fillProportionally
        
        tripNameStackView.spacing = 10
        tripNameStackView.setAnchor(top: bgView.topAnchor,
                                    left: bgView.leftAnchor,
                                    leading: nil,
                                    bottom: nil,
                                    right: bgView.rightAnchor,
                                    trailing: nil,
                                    paddingTop: stackviewPadding,
                                    paddingLeft: stackviewPadding,
                                    paddingBottom:0,
                                    paddingRight: stackviewPadding,
                                    height: 100
        )
        
        
        let costReviewStackview = UIStackView(arrangedSubviews: [costLabel, reviewLabel])
        bgView.addSubview(costReviewStackview)
        costReviewStackview.axis = .horizontal
        costReviewStackview.alignment =  .trailing
        costReviewStackview.distribution = .fillEqually
        costReviewStackview.setAnchor(top: tripNameStackView.bottomAnchor, left: bgView.leftAnchor, leading: nil, bottom: nil, right: bgView.rightAnchor, trailing: nil, paddingTop: 20, paddingLeft: stackviewPadding, paddingBottom: stackviewPadding, paddingRight: stackviewPadding)
        
        bgView.addSubview(lineView)
        lineView.setAnchor(top: costReviewStackview.bottomAnchor, left: bgView.leftAnchor, leading: nil, bottom: nil, right: bgView.rightAnchor, trailing: nil, paddingTop: 20, paddingLeft: stackviewPadding, paddingBottom: 0, paddingRight: stackviewPadding, height: 0.5)
        
        bgView.addSubview(descriptionLabel)
        descriptionLabel.setAnchor(top: lineView.bottomAnchor, left: bgView.leftAnchor, leading: nil, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, trailing: nil, paddingTop: 20, paddingLeft: stackviewPadding, paddingBottom: stackviewPadding, paddingRight: stackviewPadding)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
