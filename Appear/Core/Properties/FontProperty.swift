//
//  FontProperty.swift
//  Alamofire
//
//  Created by John Paul on 6/15/18.
//

import Foundation

/**
 FontProperty
 
 Updates the font of the control
 */
public struct FontProperty: Property, Equatable {

    public var font: UIFont

    public init(font: UIFont) {
        self.font = font
    }

    public init(name: String, size: CGFloat) {
        self.init(font: UIFont(name: name, size: size)!)
    }

    public func apply(view: UIView) {
        switch view {
        case let l as UILabel:
            l.font = font
        case let v as UITextView:
            v.font = font
        case let b as UIButton:
            b.titleLabel?.font = font
        default:
            break
        }
    }

    public var identifier: String {
        return "Font"
    }

}

public func == (lhs: FontProperty, rhs: FontProperty) -> Bool {
    return lhs.font == rhs.font
}
