//
//  CubicCollectionViewCell.swift
//  CubicController
//
//  Created by andres portillo on 1/7/17.
//  Copyright © 2017 andres portillo. All rights reserved.
//

import UIKit

open class CubicCollectionViewCell: UICollectionViewCell {
    open override func prepareForReuse() {
        super.prepareForReuse()
        setAnchorPoint(CGPoint(x: 0.5, y: 0.5))
    }
}
