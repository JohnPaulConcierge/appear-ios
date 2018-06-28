//
//  Appear.swift
//  Appear
//
//  Created by John Paul on 6/14/18.
//

import Foundation

/// The application styles.
///
/// You can either use this variable as is, or use the `build(components:)` function
///
/// This module variable is used in the setter of `UIView.styleName` variable.
public var styles: [String: Style]?

public func build(components: [String: [StyleComponent]]) {
    Appear.styles = Builder(components: components).build()
}
