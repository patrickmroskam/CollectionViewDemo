//
//  DataItem.swift
//  CollectionViewDemo
//
//  Created by Patrick Roskam on 3/25/18.
//  Copyright © 2018 PatrickMRoskam. All rights reserved.
//

import UIKit

class DataItem {
    var title: String
    var kind: Kind
    var imageName: String
    
    init(title: String, kind: Kind, imageName: String) {
        self.title = title
        self.kind = kind
        self.imageName = imageName
    }
}

enum Kind: Int {
    case Plant
    case Animal
    
    func description() -> String {
        switch self {
        case .Plant:
            return "Plants"
        case .Animal:
            return "Animals"
        }
    }
}
