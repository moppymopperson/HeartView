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
     A copy of the outline view that is used a mask for the heart
     when it fills up
     */
    @IBOutlet private weak var maskImageView: UIImageView!
    
    /** 
     An all read view that is masked with
     */
    @IBOutlet private weak var filledHeartView: UIView!
    
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
    var value:CGFloat = 1.0 {
        willSet {
            updateHeight()
        }
    }
    
    /** 
     Setup masking, since that can't be done in IB directly.
     See 'RenderableView' for more details.
     */
    override func setup() {
        layoutIfNeeded()
        filledHeartView.mask = maskImageView
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
