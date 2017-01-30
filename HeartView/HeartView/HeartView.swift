//
//  HeartView.swift
//  HeartView
//
//  Created by Erik Hornberger on 2017/01/23.
//  Copyright © 2017年 EExT. All rights reserved.
//

import Foundation
import UIKit

/** 
 A heart shaped view that mimicking the one in Apple's CareKit, but
 built with .xib file instead, and made to render properly in IB.
 */
@IBDesignable class HeartView: RenderableView {
 
    /** 
     This is used as the outline of the heart when it is not
     full
     */
    @IBOutlet private weak var outlineView: UIImageView!
    

    /** 
     A second copy of the outline image, but this time with the
     rendering mode set to template so that all non-transparent pixels
     are made the tint color of the view
     */
    @IBOutlet private weak var filledHeartImage: UIImageView!
    
    /** 
     This is resized to hide the top part of the heart view
     and create the illusion of the heart filling up.
     */
    @IBOutlet private weak var clippingView: UIView!
    
    /** 
     The distance from the top of the view to the top of the 
     clipping view (effectively the top of the fill)
     */
    @IBOutlet private weak var topConstraint: NSLayoutConstraint!
    
    /** 
     Set this to between 0 and 1 to adjust the percent of the
     heart that is filled.
     */
    @IBInspectable var value:CGFloat = 1.0 {
        didSet {
            updateHeight()
        }
    }
    
    /** 
     Sets the fill color of the heart. Actually just a mapping of tint.
     */
    @IBInspectable var fillColor:UIColor {
        get { return tintColor  }
        set { tintColor = newValue }
    }
    
    
    /** 
     Additional setup can be performed here. Essentially equivalent to 'viewDidLoad'
     */
    override func setup() {
        layoutIfNeeded()
        filledHeartImage.image = outlineView.image?.withRenderingMode(.alwaysTemplate)
        fillColor = .red
    }

    /** 
     Play a fill animation
     */
    private func updateHeight() {
        
        UIView.animate(withDuration: 1.0) { 
            self.layoutIfNeeded()
            self.topConstraint.constant = self.frame.height * (1 - self.value)
            self.layoutIfNeeded()
        }
    }
}
