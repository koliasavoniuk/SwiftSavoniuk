//
//  LoadingViewContainer.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/25/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class LoadingViewContainer: UIView, ComposableLoadingView {
    typealias LoadingViewType = SpinnerLoadingView
    
    class func defaultLoadingView(in view: UIView) -> SpinnerLoadingView? {
        return SpinnerLoadingView.loadingView(in: view)
    }
    
    lazy var loadingView: SpinnerLoadingView? = LoadingViewContainer.defaultLoadingView(in: self)
    
}
