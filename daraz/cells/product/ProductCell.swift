//
//  ProductCell.swift
//  daraz
//
//  Created by Tipu on 25/10/23.
//

import UIKit

class ProductCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    
    @IBOutlet weak var collectionView2: UICollectionView!
    
    let arr = ["fvfv","fff","sss","ssss","sfvrfwr","fvfv","fff","sss","ssss","sfvrfwr"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView2.delegate = self
        collectionView2.dataSource = self
    }
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! ProductCollectionViewCell
        cell.lable.text = arr[indexPath.row]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3)-10, height: collectionView.frame.height)
    }
}
