//
//  Style.swift
//  Alamofire
//
//  Created by John Paul on 6/14/18.
//

import Foundation

public struct Style {
    
    public var properties: [Property]
    
    public init(properties: [Property]) {
        self.properties = properties
    }
    
    public func apply(view: UIView) {
        for p in properties {
            p.apply(view: view)
        }
    }
    
}
