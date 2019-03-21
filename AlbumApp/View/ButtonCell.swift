//
//  ButtonCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/10.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell, UITableViewDataSource {
    static let cellId = "BtncCellId"
    
    let titles = ["Itinerary", "Map", "Package details", "Cancellation Policy", "Important booking Information"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.cellId)
        tableView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 200)
        tableView.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView: UITableView = {
       let tbV = UITableView()
        tbV.allowsSelection = false
        tbV.isScrollEnabled = false

        return tbV
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.cellId, for: indexPath) as! TableCell
        cell.label.text = titles[indexPath.row]

        return cell
    }

}

class TableCell: UITableViewCell {
    static let cellId = "cellId"
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.frame = CGRect(x: 20, y: 0, width: 340, height: 40)
        return lbl
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
