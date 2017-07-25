//
//  SpinnerLoadingView.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/25/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class SpinnerLoadingView: UIView, AlphaLoadingView {
    @IBOutlet var indicatorView: UIActivityIndicatorView?
    
    static func loadingView(in superView: UIView) -> SpinnerLoadingView? {
        let loadingView:SpinnerLoadingView? = UINib.objectWithType(type(of: SpinnerLoadingView()))
        
        loadingView?.frame = superView.bounds
        superView.addSubview(loadingView!)
        loadingView?.setNeedsDisplay()
        loadingView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        return loadingView
    }
    
}
