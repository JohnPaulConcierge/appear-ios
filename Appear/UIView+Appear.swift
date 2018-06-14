//
//  UIView+Appear.swift
//  Alamofire
//
//  Created by John Paul on 6/14/18.
//

import Foundation

public extension UIView {
    
    @IBInspectable
    public var styleName: String? {
        get {
            return nil
        }
        set {
            if let n = newValue, let style = styles?[n] {
                style.apply(view: self)
            }
        }
    }
    
}
