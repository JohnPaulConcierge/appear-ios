//
//  ForegroundColorProperty.swift
//  Alamofire
//
//  Created by John Paul on 6/15/18.
//

import Foundation

/// Colors the title of a view.
public struct ForegroundColorProperty: Property, Equatable {

    public var colors: [ControlState: UIColor]

    public init(colors: [ControlState: UIColor]) {
        self.colors = colors
    }

    public init(color: UIColor) {
        self.init(colors: [.normal: color,
                           .disabled: color.withAlphaComponent(0.4)])
    }

    public func apply(view: UIView) {
        switch view {
        case let l as UILabel:
            l.textColor = colors[.normal]
            l.highlightedTextColor = colors[.highlighted]
        case let v as UITextView:
            v.textColor = colors[.normal]
        case let b as UIButton:
            colors.forEach {
                b.setTitleColor($0.value, for: $0.key.uiControlState)
            }
        case let a as UIActivityIndicatorView:
            a.color = colors[.normal]
        case let s as UISwitch:
            s.thumbTintColor = colors[.normal]
            s.onTintColor = colors[.selected]
        default:
            view.tintColor = colors[.normal]
            break
        }
    }

    /// Combines the property with a newer version by simply merging the `colors` dictionary.
    /// If the parameter is of another type, then it is simply returned.
    ///
    /// - Parameter property: a property
    public func combined(with property: Property) -> Property {
        guard let tp = property as? ForegroundColorProperty else {
            return property
        }
        var p = self
        tp.colors.forEach {
            p.colors[$0.key] = $0.value
        }
        return p
    }

    public var identifier: String {
        return "TitleColor"
    }

}


public func == (lhs: ForegroundColorProperty, rhs: ForegroundColorProperty) -> Bool {
    return lhs.colors == rhs.colors
}
