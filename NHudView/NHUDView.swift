//
//  NHUDViwe.swift
//  NHudView
//
//  Created by Nero Zuo on 15/8/5.
//  Copyright (c) 2015年 Nero Zuo. All rights reserved.
//

import UIKit

class NHUDView: UIView {
    
    var text: String = " "
    
    var animationCompleteBlock: ((animation: POPAnimation!,finished: Bool) -> ())?
    
    init(inView view: UIView, animated: Bool) {
        super.init(frame: view.bounds)
        self.opaque = false
        view.addSubview(self)
        view.userInteractionEnabled = false
//        self.showAnimated(animated)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showAnimated(animated: Bool) {
        if animated {
            self.alpha = 0.0
            let animation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
            animation.fromValue = NSValue(CGSize: CGSize(width: 1.3, height: 1.3))
            animation.toValue = NSValue(CGSize:CGSize(width: 1.0, height: 1.0))
            animation.duration = 0.33
            
            let fade = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
            fade.fromValue = 0.0
            fade.toValue = 1.0
            fade.duration = 0.33
            self.layer.pop_addAnimation(animation , forKey: nil)
            self.layer.pop_addAnimation(fade, forKey: nil)
            
            let fadeOut = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
            fadeOut.fromValue = 1.0
            fadeOut.toValue = 0.0
            fadeOut.duration = 0.33
            fadeOut.beginTime = CACurrentMediaTime() + 0.33
            self.layer.pop_addAnimation(fadeOut, forKey: nil)
            fadeOut.completionBlock = animationCompleteBlock
        }
    }
    
    
    
    override func drawRect(rect: CGRect) {
        let boxWidth: CGFloat = 96.0
        let boxHeight: CGFloat = 96.0
        let boxRect = CGRect(x: (bounds.size.width - boxWidth)/2.0, y: (bounds.size.height - boxHeight)/2.0, width: boxWidth, height: boxHeight)
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10.0)
        UIColor.grayColor().setFill()
        roundedRect.fill()
        
        let image = UIImage(named: "Checkmark")!
        let imagePoint = CGPoint(x: center.x - image.size.width/2.0, y: center.y - image.size.height/2 + boxHeight/8 )
        image.drawAtPoint(imagePoint)
        
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(16.0),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
        ]
        let textSize = self.text.sizeWithAttributes(attributes)
        let point = CGPoint(x: center.x - textSize.width/2.0, y: center.y - textSize.height/2 - boxHeight/4)
        let str = NSAttributedString(string: text, attributes: attributes)
        text.drawAtPoint(point, withAttributes:attributes)
        
    }

}
