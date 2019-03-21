//
//  ViewController.swift
//  AlbumApp
//
//  Created by Pavel Bogart on 2/10/17.
//  Copyright © 2017 Pavel Bogart. All rights reserved.
//

import UIKit

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
    
    
    
}

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let sectionArray = ["Recently viewd", "Popular destinations", "Staff-Picked", "Around current location"]
    
    var trips: [Travel] = {
        let trips = [Travel(tripName: "Day Tour from Waikiki: Kualoa Ranch - Jurassic Park Adventure", location: Location(country: "United States", city: "Hawaii", image: #imageLiteral(resourceName: "album9")), cost: 5616, image: #imageLiteral(resourceName: "album3"), isFavorited: false, detail: DetailData(productNo: 72883, detailInfo: "The one and only trip you're gonna have in lifetime. Book this RIGHT NOW.", detailImages: [#imageLiteral(resourceName: "album2"), #imageLiteral(resourceName: "album5"), #imageLiteral(resourceName: "album7")])),
                     Travel(tripName: "Disneyland 1 day tick", location: Location(country: "Japan", city: "Tokyo", image: #imageLiteral(resourceName: "album7")), cost: 2094, image: #imageLiteral(resourceName: "album1"), isFavorited: false, detail: DetailData(productNo: 17884, detailInfo: "The one and only shitty trip you're gonna have in lifetime. Book this RIGHT NOW.", detailImages: [#imageLiteral(resourceName: "album2"), #imageLiteral(resourceName: "album1"), #imageLiteral(resourceName: "album5")])),
                     Travel(tripName: "Petronas Tower sightseeing", location: Location(country: "Malaysia", city: "Kuala Lumpur", image: #imageLiteral(resourceName: "image5")), cost: 1490, image: #imageLiteral(resourceName: "album5"), isFavorited: false, detail: DetailData(productNo: 77883, detailInfo: "The one and only fabulous trip you're gonna have in lifetime. Book this RIGHT NOW.", detailImages: [#imageLiteral(resourceName: "album2"), #imageLiteral(resourceName: "album1"), #imageLiteral(resourceName: "album5")])),
                     Travel(tripName: "Sydney Trip", location: Location(country: "Australia", city: "Sydney", image: #imageLiteral(resourceName: "image4")), cost: 10839, image: #imageLiteral(resourceName: "album6"), isFavorited: false, detail: DetailData(productNo: 77883, detailInfo: "The one and only expenseive trip you're gonna have in lifetime. Book this RIGHT NOW.", detailImages: [#imageLiteral(resourceName: "album2"), #imageLiteral(resourceName: "album1"), #imageLiteral(resourceName: "album5")])),
                     Travel(tripName: "Thailand Trip", location: Location(country: "Thailand", city: "Bangkog", image: #imageLiteral(resourceName: "album8")), cost: 1849, image: #imageLiteral(resourceName: "album4"), isFavorited: false,detail: DetailData(productNo: 77883, detailInfo: "The one and only ho ho ho trip you're gonna have in life time. Book this RIGHT NOW.", detailImages: [#imageLiteral(resourceName: "album2"), #imageLiteral(resourceName: "album1"), #imageLiteral(resourceName: "album5")]))
        ]
        return trips
    }()
        
    fileprivate let tripId = "tripId"
    fileprivate let popDestId = "popDestId"
    fileprivate let headerId = "headerId"
    fileprivate let padding: CGFloat = 8
    
    let searchBar = UISearchBar()
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        let tr = UITapGestureRecognizer()
        tr.addTarget(self, action: #selector(resignKeyboard))
        return tr
    }()
    
    @objc func resignKeyboard() {
        searchBar.resignFirstResponder()
    }

    private let collectionView = BaseCollectionView(scrollDirection: .vertical)

    private let backgrounImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        setupViews()
        searchBar.delegate = self
//        createObserver()
    
    }
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(like(notification:)), name: .buttonRadio, object: nil)
    }
    
    @objc func tap() {
        print("Bite me")
    }
    
    @objc func like(notification: Notification) {
        guard let userInfo = notification.userInfo?[NotificationKey.liked] as? Int else { return }
        self.trips[userInfo].isFavorited.toggle()
        
        print(trips[userInfo].isFavorited)
    }

    
    private func setupViews() {
        view.addSubview(backgrounImageView)
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, leading: nil, bottom: view.bottomAnchor, right: view.rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        backgrounImageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, leading: nil, bottom: view.bottomAnchor, right: view.rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        searchBar.placeholder = "Find your bloody trip..."
        navigationItem.titleView = searchBar
        
        let notifyBtn = UIBarButtonItem(title: "Bite Me", style: .plain, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = notifyBtn
        
    }
    
    fileprivate func cellRegister() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PopCell.self, forCellWithReuseIdentifier: popDestId)
        collectionView.register(TripCell.self, forCellWithReuseIdentifier: tripId)
        collectionView.register(MyUICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MyUICollectionReusableView
        
        headerView.label.text = sectionArray[indexPath.section]
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 40)
        
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("reload num of item")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popDestId, for: indexPath) as! PopCell
            cell.trips = trips
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripId, for: indexPath) as! TripCell
            
            print("did trans trips from controller to cell")
            print("print the boolean Main Controller \(self.trips[indexPath.item].isFavorited)")
            cell.delegate = self
            cell.mainController = self
            cell.trips = trips
            
            
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: view.frame.width - ( 2 * padding), height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
}

extension MainViewController: MoveDelegate {
    func move(indexpath: IndexPath) {
        
        let detailviewcontroller = DetailViewController.init(collectionViewLayout: StretchHeaderFlowLayout())
        detailviewcontroller.delegate = self
        detailviewcontroller.hidesBottomBarWhenPushed = true
        detailviewcontroller.trip = trips[indexpath.item]
        detailviewcontroller.indexPath = indexpath
    
        self.navigationController?.pushViewController(detailviewcontroller, animated: true)
    }
    
}



extension MainViewController: TripDelegate {
    func favoriteThis(index: IndexPath) {
        trips[index.item].isFavorited.toggle()
        self.collectionView.reloadData()
    }
        
}





