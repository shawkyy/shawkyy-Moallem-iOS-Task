//
//  SubjectsCollectionViewCell.swift
//  Moallem iOS Task
//
//  Created by Abdalla Shawky on 6/15/20.
//  Copyright © 2020 Abdalla Shawky. All rights reserved.
//

import UIKit

class SubjectsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var subjectImageParentView: UIView!
    
    @IBOutlet weak var subjectNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subjectImageParentView.layer.cornerRadius = 15
        
        subjectImageParentView.layer.masksToBounds = false
        subjectImageParentView.layer.shadowColor = #colorLiteral(red: 0.2670135796, green: 0.725918591, blue: 0.335519731, alpha: 1)
        subjectImageParentView.layer.shadowOffset = .init(width: 2, height: 0)
        subjectImageParentView.layer.shadowOpacity = 0.4
        subjectImageParentView.layer.shadowRadius = 4
        subjectImageParentView.layer.shadowPath = UIBezierPath(roundedRect: subjectImageParentView.bounds, cornerRadius: subjectImageParentView.layer.cornerRadius).cgPath
    }
    
}
