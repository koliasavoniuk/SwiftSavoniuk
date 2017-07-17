//
//  UITableView+IDPExtensions.swift
//  IDPSwiftSavoniuk
//
//  Created by Student002 on 7/17/17.
//  Copyright © 2017 Student002. All rights reserved.
//

import UIKit

extension UITableView {
    
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
        let cell = self.dequeueReusableCellWithClass(type, for: indexPath)
        cast(cell).do(configure)
        
        return cell
    }
    
    func updateWithFunction(function: () -> ()) {
        self.beginUpdates()
        function()
        self.endUpdates()
    }
    
}
