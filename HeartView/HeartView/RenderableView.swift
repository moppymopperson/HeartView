//
//  RenderableView.swift
//  HeartView
//
//  Created by Erik Hornberger on 2017/01/23.
//  Copyright © 2017年 EExT. All rights reserved.

import UIKit


/**
 Subclass IBRenderableView on any UI component with a matching .xib file to automatically make
 it render in Interface Builder
 */
@IBDesignable class RenderableView: UIView {
    
    /// Override the init methods for views of this class and load the .xib
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setup()
    }
    
    /// Override the init methods for views of this class and load the .xib
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setup()
    }
    
    /// This function can be overridden by subclasses to perform any extra setup following loading of the xib file. Frames will still not have finished loading yet, so don't try any animations here
    internal func setup() {
        
    }
    
    /// Adds the stars view as a subview
    private func xibSetup() {
        
        let childView:UIView? = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        childView!.frame = bounds
        
        // Make the view stretch with containing view
        childView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        childView!.backgroundColor  = UIColor.clear
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(childView!)
    }
    
    /// Loads the view defined in ThisClassName.xib
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib    = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view   = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
