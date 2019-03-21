//
//  DetailViewController.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/9.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let heartButton: UIButton = {
       let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "icons8-filled_like"), for: .normal)
        return btn
    }()
    
    var trip: Travel?
    var delegate: TripDelegate?
    var indexPath: IndexPath?

    
    fileprivate let padding: CGFloat = 8
    
    fileprivate func addNaviBarButtons() {
        
        let likeBarButton = UIBarButtonItem.init(title: "♥️", style: .plain, target: self, action: #selector(tap))
        
    
        let shareBarButton = UIBarButtonItem.init(title: "🧞‍♂️", style: .plain, target: self, action: #selector(tap))
        navigationController?.navigationBar.barStyle = .default
        navigationItem.rightBarButtonItems = [shareBarButton, likeBarButton]

    }
    
    
    
    @objc func tap() {

        print("did tapped")
        
        guard let indexPath = self.indexPath else {return}
        print(trip!.isFavorited)
        trip!.isFavorited.toggle()
        delegate?.favoriteThis(index: indexPath)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.lightestGray
        
        cellRegister()
        setupLayout()
        addNaviBarButtons()
        
    }
    
    fileprivate func addFloatingButtons() {
        let bottomView = UIView()
        self.view.addSubview(bottomView)
        bottomView.backgroundColor = .white
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowRadius = 1
        bottomView.layer.shadowOpacity = 0.5
        bottomView.layer.shadowOffset = CGSize(width: -1, height: -1)
        
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 12).isActive = true
        
        let buttonOnView = UIButton()
        self.view.addSubview(buttonOnView)
        buttonOnView.setTitle("Book Now", for: .normal)
        buttonOnView.backgroundColor = UIColor.lightBlue
        
        buttonOnView.translatesAutoresizingMaskIntoConstraints = false
        buttonOnView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        buttonOnView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        buttonOnView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
        buttonOnView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16).isActive = true
        buttonOnView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 16).isActive = true
        
        buttonOnView.layer.cornerRadius = self.view.frame.height / 32
        
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("💬", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleColorEmoji", size: 45)
        button.backgroundColor = .white
        
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowRadius = 1
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: self.view.frame.height / 12).isActive = true
        button.widthAnchor.constraint(equalToConstant: self.view.frame.height / 12).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -16).isActive = true
        
        button.layer.cornerRadius = self.view.frame.height / 24
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addFloatingButtons()
//        button.clipsToBounds = true
        
        
    }
    


    fileprivate func cellRegister() {
        self.collectionView!.register(DetailViewCell.self, forCellWithReuseIdentifier: DetailViewCell.reuseIdentifier)
        self.collectionView!.register(OverviewCell.self, forCellWithReuseIdentifier: OverviewCell.reuseIdentifier)
        self.collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.cellId)
        
        

        self.collectionView.register(CoverHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CoverHeaderCollectionReusableView.cellId)
        
        self.collectionView.register(DummyReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DummyReusableView.cellId)
    }
    
    fileprivate func setupLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.reuseIdentifier, for: indexPath) as! DetailViewCell

            guard let trip = trip else {return UICollectionViewCell() }
            cell.trip = trip
            
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OverviewCell.reuseIdentifier, for: indexPath) as! OverviewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.cellId, for: indexPath) as! ButtonCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 2 {
        return CGSize(width: self.view.frame.width, height: 220)
        }
        return CGSize(width: self.view.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CoverHeaderCollectionReusableView.cellId, for: indexPath) as! CoverHeaderCollectionReusableView
//            guard let trip = trip else {return UICollectionViewCell()}
            headerCell.customImageView.image = trip?.image
            
            if let detailImages = trip?.detail.detailImages {
                headerCell.images = detailImages
            }

        return headerCell
        }
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DummyReusableView.cellId, for: indexPath)
        

        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: self.view.frame.width, height: 340)
        }
        return CGSize(width: self.view.frame.width, height: 10)
    }


}

