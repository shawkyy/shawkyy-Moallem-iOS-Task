//
//  RoundedCornersView.swift
//  Moallem iOS Task
//
//  Created by Abdalla Shawky on 6/15/20.
//  Copyright © 2020 Abdalla Shawky. All rights reserved.
//

import UIKit

class RoundedCornersView: UIView {

    override func layoutSubviews() {
          super.layoutSubviews()
          layer.cornerRadius = 3
          self.layer.masksToBounds = true
          self.clipsToBounds = true
      }

}
