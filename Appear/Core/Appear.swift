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

public func style(for name: String) -> Style? {
    if let s = styles?[name] {
        return s
    } else if let i = name.firstIndex(of: ":"),
        i != name.endIndex {
        return styles?[String(name.suffix(from: name.index(after: i)))]
    }
    return nil
}
