//
//  StyleComponent.swift
//  Appear
//
//  Created by John Paul on 6/21/18.
//

import Foundation

/// An empty protocol reprenting a style component, i-e something that can be used to build a style.
///
/// This is just to be used as a type in the `build(components:)` function
///
/// - a `Property` is a style component because it can be added to a style
/// - a `Style` is a style component because its properties can be combined with another style
/// - a `String` is a style component because the associated style can be combined with another style
public protocol StyleComponent {

}

extension Array: StyleComponent where Element: Property {

}

extension String: StyleComponent {

}
