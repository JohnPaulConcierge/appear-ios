//
//  Style.swift
//  Alamofire
//
//  Created by John Paul on 6/14/18.
//

import Foundation

/// A style is an array of properties
public struct Style {

    public var properties: [Property]

    /// Designated init function
    public init(properties: [Property] = []) {
        self.properties = properties
    }

    public mutating func add(property: Property) {

        for (i, p) in properties.enumerated() {
            if (p.identifier == property.identifier) {
                // No idea why the cast is required here :/
                properties[i] = p.combined(with: property)
                return
            }
        }
        // No idea why the cast is required here either :/
        properties.append(property)
    }

    /// Combines 2 styles
    ///
    /// The combination is done by adding all the properties of the parameter to the instance, in other words,
    /// the properties of the instance will be updated with the properties of the style passed in parameter.
    ///
    /// - Parameter style: a style
    /// - Returns: the combined style
    public func combined(with style: Style) -> Style {
        var new = self
        style.properties.forEach {
            new.add(property: $0)
        }
        return new
    }

    /// Applies all properties to the view.
    ///
    /// - Parameter view: the view
    public func apply(view: UIView) {
        for p in self.properties {
            p.apply(view: view)
        }
    }
}
