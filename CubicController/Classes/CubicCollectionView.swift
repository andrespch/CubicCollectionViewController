//
//  StoriesCell.swift
//  InstagramStoriesLayout
//
//  Created by andres portillo on 1/7/17.
//  Copyright © 2017 andres portillo. All rights reserved.
//

import UIKit

class CubicCollectionViewCell: UICollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        setAnchorPoint(CGPoint(x: 0.5, y: 0.5))
    }
}
