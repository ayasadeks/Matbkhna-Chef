//
//  collectionResturantDetailes.swift
//  Mtbakhna
//
//  Created by Rania on 9/14/19.
//  Copyright © 2019 Rania. All rights reserved.
//

import UIKit

extension RAResturantDetailes : UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        if collectionView == dishesCollectionView{
            print("dishArray.count\(dishArray.count)")
            count = dishArray.count
        }else if collectionView == reviewCollectionView{
            count = 5
            
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if collectionView == dishesCollectionView{
            var dishesCVC =  collectionView.dequeueReusableCell(withReuseIdentifier: "dishesCVC", for: indexPath) as! RADishesCVC
            dishesCVC.configure(item: dishArray.self, index: indexPath, imageUrl: dishImageUrl)
            cell = dishesCVC

        }else if collectionView == reviewCollectionView{
            var reviewsCVC =  collectionView.dequeueReusableCell(withReuseIdentifier: "reviewsCVC", for: indexPath) as! RAReviewsCVC
            cell = reviewsCVC
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var size = CGSize(width: 105, height: 240)
//        if collectionView == dishesCollectionView{
//            size = CGSize(width: collectionView.bounds.size.width/2, height: 240)
//        }else if collectionView == reviewCollectionView{
//            size = CGSize(width: 280, height: 140)
//
//        }
//        return size
//    }//end of sizeForItemAt
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        if collectionView == dishesCollectionView{
            let count = self.dishArray.count
            if indexPath.row == count-1 {
                LoadMore()
            }
        }

        
    }//end of willDisplay
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
