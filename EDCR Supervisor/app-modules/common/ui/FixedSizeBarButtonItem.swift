//
//  FixedSizeBarButtonItem.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 4/6/24.
//

import Foundation
import UIKit

class FixedSizeBarButtonItem: UIBarButtonItem {

    init(image: UIImage?, width: CGFloat, height: CGFloat, target: Any?, action: Selector?) {
        super.init()
        
        // Create a UIImageView with the fixed size
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        let imageSize = CGSize(width: width, height: height)
        imageView.frame = CGRect(origin: .zero, size: imageSize)
        
        // Create a UIView container for the UIImageView
        let containerView = UIView(frame: imageView.frame)
        containerView.addSubview(imageView)
        
        // Set the customView of the UIBarButtonItem to the container view
        self.customView = containerView
        
        // Set the target and action for the bar button item
        self.target = target as AnyObject?
        self.action = action
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
