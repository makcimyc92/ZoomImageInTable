//
//  MVZoomImageCell.swift
//  ZoomImageInTable
//
//  Created by Max Vasilevsky on 3/30/17.
//  Copyright © 2017 Max Vasilevsky. All rights reserved.
//

import UIKit

class MVZoomImageCell: UITableViewCell {
    
    @IBOutlet weak var bigImage: MVZoomImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
