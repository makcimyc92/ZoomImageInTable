//
//  MVZoomImageView.swift
//  ZoomImageInTable
//
//  Created by Max Vasilevsky on 3/30/17.
//  Copyright © 2017 Max Vasilevsky. All rights reserved.
//

import UIKit

class MVZoomImageView: UIImageView {
    
    var startFrame: CGRect = CGRect.zero

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        self.addGestureToSelf()
    }
    
    func addGestureToSelf() {
        let pinch = UIPinchGestureRecognizer.init(target: self, action: #selector(handlerPinchGesture(_:)))
        self.addGestureRecognizer(pinch)
    }
    
    func handlerPinchGesture(_ sender: UIPinchGestureRecognizer) {
        if self.image == nil {
            return
        }
        switch sender.state {
        case .changed:
            self.transform = CGAffineTransform.init(scaleX: sender.scale, y: sender.scale)
        case .ended:
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity
            }
        default:
            break
        }
    }

}
