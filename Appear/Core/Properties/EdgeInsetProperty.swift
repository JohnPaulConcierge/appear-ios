//
//  EdgeInsetProperty.swift
//  Appear
//
//  Created by John Paul on 7/30/18.
//

import Foundation

public struct EdgeInsetsProperty: Property {

    public var insets: UIEdgeInsets

    public var identifier: String {
        return "EdgeInsets"
    }

    public init(insets: UIEdgeInsets) {
        self.insets = insets
    }

    public func apply(view: UIView) {
        switch view {
        case let button as UIButton:
            button.contentEdgeInsets = insets
        default:
            break
        }
    }

}
