//
//  UITableView+Extensions.swift
//  SwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

extension UITableView {
    
    @nonobjc static var registeredNib = Dictionary<String, UINib>()
    
    func dequeueReusableCellWithClass(
        _ cellClass: AnyClass,
        for indexPath: IndexPath
        )
        -> UITableViewCell
    {
        let identifier = String(describing: cellClass)
        let nib = UINib.nib(with: cellClass, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
        
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    func reusableCellWithClass<Result :UITableViewCell>(
        _ type: Result.Type,
        for indexPath: IndexPath,
        configure: (Result) -> ()
        )
        -> UITableViewCell
    {
        let identifier = String(describing: type)
        let nib: UINib
        
        if (UITableView.registeredNib[identifier] == nil) {
            nib = UINib.nib(with: type)
            self.register(nib, forCellReuseIdentifier: identifier)
            UITableView.registeredNib[identifier] = nib
        }
        
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cast(cell).do(configure)
        
        return cell
    }  
}
