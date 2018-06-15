//
//  FontProperty.swift
//  Alamofire
//
//  Created by John Paul on 6/15/18.
//

import Foundation


public struct FontProperty: Property {
    
    public var font: UIFont
    
    public init(font: UIFont) {
        self.font = font
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
    
}
