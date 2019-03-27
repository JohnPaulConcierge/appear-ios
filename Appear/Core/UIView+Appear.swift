//
//  UIView+Appear.swift
//  Alamofire
//
//  Created by John Paul on 6/14/18.
//

import Foundation

private var AssociatedStyleNameHandle: UInt8 = 0

public extension UIView {

    /**
     Associates a style name to a view.
     
     The setter of this variable apply the style found in the `styles` module variable
     */
    @IBInspectable
    var styleName: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedStyleNameHandle) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedStyleNameHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let n = newValue, let style = style(for: n) {
                style.apply(view: self)
            }
        }
    }

}
