//
//  CategoryCell.swift
//  daraz
//
//  Created by Tipu on 25/10/23.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView3: UICollectionView!
    
    let arr = ["100","200","300","400","500","600","700","800","900","1000","100","200","300","400","500","600","700","800","900","1000"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Disable scrolling for the internal UICollectionView
        //collectionView3.isScrollEnabled = false
        collectionView3.delegate = self
        collectionView3.dataSource = self
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! CategoryCollectionViewCell
        cell.lable.text = arr[indexPath.row]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width-20, height: collectionView.frame.height/CGFloat(arr.count)-10)
    }
}
