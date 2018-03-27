//
//  DataItemHeader.swift
//  CollectionViewDemo
//
//  Created by Patrick Roskam on 3/26/18.
//  Copyright © 2018 PatrickMRoskam. All rights reserved.
//

import UIKit

class DataItemHeader: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}
