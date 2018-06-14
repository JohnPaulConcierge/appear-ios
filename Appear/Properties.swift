//
//  Properties.swift
//  Pods
//
//  Created by John Paul on 6/14/18.
//

import Foundation


public protocol Property {
    
    func apply(view: UIView)
    
}

public struct FontProperty: Property {
    
    public var font: UIFont
    
    public init(font: UIFont) {
        self.font = font
    }
    
    public func apply(view: UIView) {
        switch view {
        case let l as UILabel:
            l.font = font
        default:
            break
        }
    }
    
}

public struct TitleColorProperty: Property {
    
    //TODO: handle different states?
    public var color: UIColor
    
    public init(color: UIColor) {
        self.color = color
    }
    
    public func apply(view: UIView) {
        switch view {
        case let l as UILabel:
            l.textColor = color
        default:
            break
        }
    }
    
}
