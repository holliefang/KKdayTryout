//
//  OverviewCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/10.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class OverviewCell: UICollectionViewCell {
    static let reuseIdentifier = "overviewCell"
    
    fileprivate let stackviewPadding: CGFloat = 8
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    
    lazy var width = frame.width
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        //        view.layer.cornerRadius = 10
        //        view.layer.masksToBounds = true
        view.frame = .zero
        //        view.layer.borderColor = UIColor.black.cgColor
        //        view.layer.borderWidth = 0.5
        return view
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        let attributedText = NSMutableAttributedString(string: "⎮Overview",
                                                       attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        lbl.attributedText = attributedText
        return lbl
    }()
    
    let durationLabel: UILabel = {
        let lbl = UILabel()
        let attributedText = NSMutableAttributedString(string: "🕙 Duration: 12 hours",
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                                    NSAttributedString.Key.foregroundColor: UIColor.gray])
        lbl.attributedText = attributedText

        return lbl
    }()
    
    let guideLanguage: UILabel = {
        let lbl = UILabel()
        
        
        let attributedText = NSMutableAttributedString(string: "💬 Guide Language: 中文, 日本語, English",
                                                              attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                                           NSAttributedString.Key.foregroundColor: UIColor.gray])
        lbl.attributedText = attributedText
        
        return lbl
    }()
    
    let descriptionLabel: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        let text = """
Beautiful is the 'thank you'
Wrapped with gratitude,
Offered to peace prone people
Who offer what is real-themselves
To nurse with love and humility
napalm asphyxiated victims
in our stained world

veiling ambition with face of
humanity.Beautiful is the moment
when sunlit world fades away
And with it mind made mirror
While look inward drawn, sight insight led,
and heart shuts out desire to let in
consciousness.
"""
        
        let attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        tv.attributedText = attributedText
        
        return tv
    }()
    
    let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()

    
    func updateCellBy(trip: Travel) {
        
    }
    
    
    func setup() {
        self.contentView.addSubview(bgView)
        bgView.setAnchor(top: topAnchor,
                         left: leftAnchor, leading: nil,
                         bottom: bottomAnchor,
                         right: rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        let tripNameStackView = UIStackView(arrangedSubviews: [titleLabel, durationLabel, guideLanguage])
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
                                    height: 100)
        
        
        bgView.addSubview(lineView)
        lineView.setAnchor(top: tripNameStackView.bottomAnchor, left: bgView.leftAnchor, leading: nil, bottom: nil, right: bgView.rightAnchor, trailing: nil, paddingTop: 20, paddingLeft: stackviewPadding, paddingBottom: 0, paddingRight: stackviewPadding, height: 0.5)
        
        bgView.addSubview(descriptionLabel)
        descriptionLabel.setAnchor(top: lineView.bottomAnchor, left: bgView.leftAnchor, leading: nil, bottom: bgView.bottomAnchor, right: bgView.rightAnchor, trailing: nil, paddingTop: 20, paddingLeft: stackviewPadding, paddingBottom: stackviewPadding, paddingRight: stackviewPadding)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
