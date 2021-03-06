//
//  BackgroundProperty.swift
//  Alamofire
//
//  Created by John Paul on 6/15/18.
//

import Foundation

/**
 Sets the view's background to either an image or a color
 */
public struct BackgroundProperty: Property, Equatable {

    public enum Kind {
        case images([ControlState: UIImage])
        case color(UIColor)
    }

    public var kind: Kind

    public init(kind: Kind) {
        self.kind = kind
    }

    public func apply(view: UIView) {

        switch (kind, view) {
        case (.color(let c), _):
            view.backgroundColor = c
        case (.images(let images), let b as UIButton):
            images.forEach {
                b.setBackgroundImage($0.value, for: $0.key.uiControlState)
            }
            b.backgroundColor = nil
        case (.images(let images), _):
            guard let i = images[.normal] else {
                return
            }
            view.backgroundColor = UIColor(patternImage: i)
            break
        }
    }

    public var identifier: String {
        return "Background"
    }

}

public func == (lhs: BackgroundProperty, rhs: BackgroundProperty) -> Bool {

    switch (lhs.kind, rhs.kind) {
    case (.images(let li), .images(let ri)):
        return li == ri
    case (.color(let lc), .color(let rc)):
        return lc == rc
    default:
        return false
    }

}
