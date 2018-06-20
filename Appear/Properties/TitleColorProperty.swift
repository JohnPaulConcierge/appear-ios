//
//  TitleColorProperty.swift
//  Alamofire
//
//  Created by John Paul on 6/15/18.
//

import Foundation

/**
 Colors the title of a view.
 */
public struct TitleColorProperty: Property {

    public var colors: [ControlState: UIColor]

    public init(colors: [ControlState: UIColor]) {
        self.colors = colors
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
        default:
            break
        }
    }

}
