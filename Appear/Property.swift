//
//  Property.swift
//  Pods
//
//  Created by John Paul on 6/14/18.
//

import Foundation

/**
 The base protocol for a property.
 */
public protocol Property {
    
    /**
     Applies the property to the view.
     This methods is called from the `Style.apply(view:)` function.
     
     - Parameter view: the view to apply the property to
     */
    func apply(view: UIView)
    
}
