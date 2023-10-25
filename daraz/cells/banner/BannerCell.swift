//
//  BannerCell.swift
//  daraz
//
//  Created by Tipu on 25/10/23.
//

import UIKit

class BannerCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerData = [UIImage(named: "a1"),
                  UIImage(named: "a2"),
                  UIImage(named: "a3"),
                  UIImage(named: "a4"),
                  UIImage(named: "a5"),
                  UIImage(named: "a6"),]
    var autoScrollTimer: Timer?
    var currentcellindex = 0
    
    override func awakeFromNib() {
         super.awakeFromNib()
         
        collectionView1.delegate = self
        collectionView1.dataSource = self
 
        
        pageControl.numberOfPages = bannerData.count
        startAutoScrollTimer()
     }
    
    
    //MARK: AUTO-SCROLL
    func startAutoScrollTimer(){
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext) , userInfo: nil, repeats: true)
    }
    @objc func slideToNext(){
        if currentcellindex < bannerData.count-1 {
            
            currentcellindex += 1
        }
        else{
            currentcellindex = 0
        }
       collectionView1.scrollToItem(at: IndexPath(item: currentcellindex, section: 0), at: .right, animated: true)
        pageControl.currentPage = currentcellindex
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! Cell1CollectionViewCell
        cell.bannerImages.image = bannerData[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
