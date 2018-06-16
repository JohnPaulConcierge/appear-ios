//
//  Style.swift
//  Alamofire
//
//  Created by John Paul on 6/14/18.
//

import Foundation

/**
 A style as in an array of properties
 */
public struct Style {
    
    /**
     The properties array
     */
    public var properties: [Property]
    
    /**
     Designated init function
     */
    public init(properties: [Property]) {
        self.properties = properties
    }
    
    /**
     Applies all properties to the view.
     */
    public func apply(view: UIView) {
        for p in properties {
            p.apply(view: view)
        }
    }
    
}
