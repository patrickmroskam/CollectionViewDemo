//
//  DataItemCell.swift
//  CollectionViewDemo
//
//  Created by Patrick Roskam on 3/26/18.
//  Copyright © 2018 PatrickMRoskam. All rights reserved.
//

import UIKit

class DataItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var dataItemImageView: UIImageView!
    
    var dataItem: DataItem? {
        didSet {
            if let dataItem = dataItem {
                dataItemImageView.image = UIImage(named: dataItem.imageName)
            }
        }
    }
    
}
