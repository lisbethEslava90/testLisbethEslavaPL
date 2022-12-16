//
//  DetailFishCollectionViewCell.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import UIKit

class DetailFishCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "DetailFishCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.8078431373, blue: 0.7921568627, alpha: 1)
        self.layer.cornerRadius = 8
        profileImageView.image = UIImage(named: "placeholder")
    }
}
