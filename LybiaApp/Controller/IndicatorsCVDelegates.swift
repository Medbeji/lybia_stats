//
//  IndicatorsCVDelegates.swift
//  LybiaApp
//
//  Created by MedBeji on 18/03/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit


extension DetailVC:  UICollectionViewDataSource, UICollectionViewDelegate ,  UICollectionViewDelegateFlowLayout {
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IndicatorCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellWidth = 60
        let cellCount = 5
        let cellSpacing = 15
        let collectionViewWidth = collectionView.frame.width
        
        let totalCellWidth = cellWidth * cellCount
        let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset   
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Select item number \(indexPath.row)")
        
    }
    
}
