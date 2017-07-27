//
//  ImageView.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/27/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

class  ImageView: LoadingViewContainer {
    
    // MARK : Public properties
    
    @IBOutlet var contentImageView: UIImageView? {
        didSet {
            oldValue?.removeFromSuperview()
            if let content = self.contentImageView {
                self.addSubview(content)
            }
        }
    }
    var imageModel: ImageModel? {
        didSet {
            if imageModel != oldValue {
                self.observer = imageModel?.observationController(observer: self)
            }
        }
    }
    
    private var observer:  ObservationController? {
        didSet {
            self.prepare(observer: observer)
        }
    }
    
    // MARK : Designated initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubviews()
    }
    
    // MARK : Private functions
    
    private func initSubviews() {
        let imageView = UIImageView(frame: self.bounds)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentImageView = imageView
    }
    
    private func prepare(observer:  ObservationController?) {
        let didLoadHandler = { (controller:  ObservationController, userInfo: Any?) -> Void in
            self.contentImageView?.image = self.imageModel?.image
            self.isLoading = false
        }
        
        let failLoadingHandler = { (controller:  ObservationController, userInfo: Any?) -> Void in
            
        }
        
        let willLoadHandler = { (controller:  ObservationController, userInfo: Any?) -> Void in
            self.isLoading = true
        }
        
        observer?.set(handler: didLoadHandler, for:  ModelState.didLoad.rawValue)
        observer?.set(handler: failLoadingHandler, for:  ModelState.failLoading.rawValue)
        observer?.set(handler: willLoadHandler, for:  ModelState.willLoad.rawValue)
    }
}

