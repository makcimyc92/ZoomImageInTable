//
//  MVZoomImageView.swift
//  ZoomImageInTable
//
//  Created by Max Vasilevsky on 3/30/17.
//  Copyright © 2017 Max Vasilevsky. All rights reserved.
//

import UIKit

class MVZoomImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
    }
}
