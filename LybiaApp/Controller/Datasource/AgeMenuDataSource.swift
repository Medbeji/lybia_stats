//
//  CategoryDS.swift
//  LybiaApp
//
//  Created by MedBeji on 25/02/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit

class AgeMenuDataSource : NSObject, UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    // Datasource
    var ageObjects = ["itemTree", "itemOne", "itemTwo", "itemTree","itemOne"]
    var collectionView : UICollectionView? 
    
    let cellId = "AgeCell"
    let cellWidth = 75
    let cellCount = 4
    let cellSpacing = 10
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ageObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75,height: 65)
    }

    
    

    

}






//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let totalCellWidth = cellWidth * cellCount
//        let totalSpacingWidth = cellSpacing * (cellCount - 1)
//        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
//        let rightInset = leftInset
//        return UIEdgeInsetsMake(1, leftInset, 1, rightInset)
//    }


//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        var contentOffsetWhenFullyScrolledRight: CGFloat = 0
//        if let cv = collectionView {
//            contentOffsetWhenFullyScrolledRight = cv.frame.size.width * CGFloat(self.ageObjects.count - 1)
//        if (scrollView.contentOffset.x == contentOffsetWhenFullyScrolledRight) {
//            let newIndexPath = IndexPath(row: 0, section: 0)
//            cv.scrollToItem(at:newIndexPath, at: .left, animated: true)
//        } else if (scrollView.contentOffset.x == 0){
//            let newIndexPath = IndexPath(row: self.ageObjects.count, section: 0)
//            cv.scrollToItem(at:newIndexPath, at: .left, animated: true)
//        }
//      }
//    }
