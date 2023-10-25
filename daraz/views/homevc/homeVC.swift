//
//  homeVC.swift
//  daraz
//
//  Created by Tipu on 23/10/23.
//

import UIKit

class homeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
 
    // MARK: - Outlets
    @IBOutlet weak var mainCollectionView: UICollectionView!

    let arr = ["100","200","300","400","500","600","700","800","900","1000","100","200","300","400","500","600","700","800","900","1000"]
    

    // Data sources for each section
    //var bannerData = [BannerItem]()
    //var productData = [ProductItem]()
    //var categoryData = [CategoryItem]()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        // Load data for the banner, products, and categories
        //loadBannerData()
        //loadProductData()
        //loadCategoryData()
        
        // Add top inset to the mainCollectionView to create extra space at the top
         //mainCollectionView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0) // Adjust the top inset as needed
     
    }


 // ...

 func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     if kind == UICollectionView.elementKindSectionHeader {
         let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView

         // Customize the header view with the section title and "See All" button
         switch indexPath.section {
       
         case 1: // Section 1: Products
             headerView.titleLabel.text = "Products"
             headerView.seeAllButton.setTitle("See All >>", for: .normal)

         case 2: // Section 2: Categories
             headerView.titleLabel.text = "Categories"
             headerView.seeAllButton.setTitle("See All >>", for: .normal)

         default:
             headerView.titleLabel.text = ""
             headerView.seeAllButton.setTitle("", for: .normal)
         }

         return headerView
     }

     return UICollectionReusableView()
 }
    // MARK: - UICollectionViewDataSource Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3 // Three sections: Banner, Products, Categories
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            //return productData.count
            return 1
        case 2:
            //return categoryData.count
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            // Dequeue and configure the banner cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            return cell
        case 1:
            // Dequeue and configure the product cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell

            return cell
        case 2:
            // Dequeue and configure the category cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            // Banner section
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3.584) // height 896 er jonnoo 250 nisi
        case 1:
            // Products section
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/5.973) // height 896 er jonnoo 200 nisi
        case 2:
            
            // Categories section
             let numberOfCategories = arr.count // Replace with your actual data source
             let categoryCellHeight: CGFloat = collectionView.frame.height/2.24// The height of each category cell(400 for 896)

             let totalHeight = CGFloat(numberOfCategories) * categoryCellHeight
             return CGSize(width: collectionView.frame.width, height: totalHeight)
        default:
            return CGSize(width: 50, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0: // Section 1: Products
            return CGSize(width: collectionView.frame.width, height: 0) // Set the height to 0
        default:
            return CGSize(width: collectionView.frame.width, height: 50) // Set the height for other sections
        }
    }

}
