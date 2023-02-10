//
//  BookCoverCollectionViewCell.swift
//  Project_graduate
//
//  Created by 윤한솔 on 2023/01/04.
//

import UIKit

class BookCoverCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var BookCoverImage: UIImageView!
    public func configure(with model: String) {
        guard let url = URL(string: "https://") else {
            return
        }
        BookCoverImage.sd_setImage(with: url,completed: nil)
    }
}
