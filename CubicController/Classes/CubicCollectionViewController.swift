//
//  CubicCollectionViewController.swift
//  CubicCollectionViewController
//
//  Created by andres portillo on 1/7/17.
//  Copyright © 2017 andres portillo. All rights reserved.
//

import UIKit

class CubicCollectionViewController: UIViewController {

    let maxAngle: CGFloat = 60
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = collectionView.bounds.size
        flowLayout.scrollDirection = .horizontal
        collectionView.backgroundColor = UIColor.gray
        collectionView.collectionViewLayout = flowLayout
    }
}


extension CubicCollectionViewController: UICollectionViewDataSource {
    final func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
}

extension CubicCollectionViewController: UIScrollViewDelegate {
    private func angleForCell(at indexPath: IndexPath) -> CGFloat {
        let p = transitionProgressForCell(at: indexPath)
        return maxAngle * p
    }
    
    private func transitionProgressForCell(at indexPath: IndexPath) -> CGFloat {
        let offsetX = collectionView.contentOffset.x
        let itemWidth = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width
        let cellX1 = CGFloat(indexPath.row) * collectionView.frame.width
        let x1 = offsetX
        let x2 = (offsetX + itemWidth)
        
        if x1 > cellX1 { //cell is shown or on its way to being hidden
            let p = (x1 - cellX1) / itemWidth
            return p
        } else if x2 > cellX1 {// cell is ahead of contentOffset.x
            let p = (x2 - cellX1) / itemWidth
            return -1 * (1 - p)
        }
        
        return 0
    }
    
    private var page: CGFloat {
        return CGFloat(collectionView.contentOffset.x / collectionView.frame.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for indexPath in collectionView.indexPathsForVisibleItems  {
            let cell = collectionView.cellForItem(at: indexPath)!
            let angle = angleForCell(at: indexPath)
            let rad = angle * (CGFloat(M_PI) / 180)
            cell.layer.transform = CATransform3DIdentity
            var transform = cell.layer.transform
            transform.m34 = 1 / 500
            transform = CATransform3DRotate(transform, rad, 0, 1, 0)
            cell.layer.transform = transform
            let x =  page > CGFloat(indexPath.row) ? 1.0 : 0.0
            cell.setAnchorPoint(CGPoint(x: x, y: 0.5))
            cell.layer.opacity = max(0.5, Float(1 - abs(transitionProgressForCell(at: indexPath))))
        }
    }
}

extension UIView {
    func setAnchorPoint(_ anchorPoint: CGPoint) {
        
        var newPoint = CGPoint(x: bounds.size.width * anchorPoint.x, y: bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = anchorPoint
    }
}
