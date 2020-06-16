//
//  RecentlyPlayedCollectionViewCell.swift
//  Moallem iOS Task
//
//  Created by Abdalla Shawky on 6/16/20.
//  Copyright © 2020 Abdalla Shawky. All rights reserved.
//

import UIKit

class RecentlyPlayedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var videoThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func adjustVideoThumbnail(for image: UIImage){
        self.videoThumbnail.image = image
    }
    
}
