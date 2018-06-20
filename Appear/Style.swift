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
     The key to a parent style
     */
    public var parent: String?

    /**
     Designated init function
     */
    public init(properties: [Property], parent: String? = nil) {
        self.properties = properties
        self.parent = parent
    }

    /**
     Applies all properties to the view.
     */
    public func apply(view: UIView) {
        if let p = parent, let s = Appear.styles?[p] {
            s.apply(view: view)
        }

        for p in properties {
            p.apply(view: view)
        }
    }

}
