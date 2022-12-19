//
//  GalleryCollectionViewCell.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 18/12/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "GalleryCollectionViewCell"
    
    @IBOutlet weak var itemGalleyImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemGalleyImageView.image = UIImage(named: "placeholder")
        itemGalleyImageView.layer.cornerRadius = 8
    }
    
    override func prepareForReuse() {
        itemGalleyImageView.image = nil
    }
}
