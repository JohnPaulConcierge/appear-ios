//
//  BorderProperty.swift
//  Appear
//
//  Created by John Paul on 7/9/18.
//

import Foundation

public struct BorderProperty: Property {

    public var color: UIColor

    public var width: CGFloat

    public var cornerRadius: CGFloat

    public init(color: UIColor, width: CGFloat = 1, cornerRadius: CGFloat = 4) {
        self.color = color
        self.width = width
        self.cornerRadius = cornerRadius
    }

    public func apply(view: UIView) {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        view.layer.cornerRadius = cornerRadius
    }

    public var identifier: String {
        return "Border"
    }

}
