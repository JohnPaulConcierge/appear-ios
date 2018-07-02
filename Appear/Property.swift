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
public protocol Property: StyleComponent {


    /// A unique identifier defining the type of property.
    ///
    /// When building a `Style`, properties of the same identifier will be combined.
    var identifier: String { get }

    /// Applies the property to the view.
    /// This methods is called from the `Style.apply(view:)` function.
    ///
    /// - Parameter view: the view to apply the property to
    func apply(view: UIView)


    /// Computes the combination of 2 properties
    ///
    /// This function should creates a new property by updating this instances with the attributes of the provided
    /// one. In other words, in can be considered that the provided argument is a "newer" version of the property.
    ///
    /// The default implementation simply returns the property argument.
    ///
    /// - Parameter with: the newest version of the property
    /// - Returns: A new property
    func combined(with property: Property) -> Property

}

public extension Property {

    func combined(with property: Property) -> Property {
        return property
    }

}
