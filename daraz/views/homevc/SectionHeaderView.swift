//
//  SectionHeaderView.swift
//  daraz
//
//  Created by Tipu on 26/10/23.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!

    // You can customize the appearance of your header view here, such as fonts, colors, etc.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Customize the appearance of the title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.black
        
        // Customize the appearance of the "See All" button
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        seeAllButton.setTitleColor(UIColor.blue, for: .normal)
    }
}
