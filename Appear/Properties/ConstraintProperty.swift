//
//  ConstraintProperty.swift
//  Pods
//
//  Created by John Paul on 6/15/18.
//

import Foundation

public struct ConstraintProperty: Property {
    
    var attributes: [NSLayoutAttribute: CGFloat]
    
    public init(attributes: [NSLayoutAttribute: CGFloat]) {
        self.attributes = attributes
    }
    
    public func apply(view: UIView) {

        view.constraints.forEach {
            if let c = attributes[$0.firstAttribute] {
                $0.constant = c
            }
        }
        
        view.superview?.constraints.forEach { constraint in
            
            let attribute: NSLayoutAttribute
            if constraint.firstItem as? UIView == view {
                attribute = constraint.firstAttribute
            } else if constraint.secondItem as? UIView == view {
                attribute = constraint.secondAttribute
            } else {
                return
            }
            
            if let c = attributes[attribute] {
                constraint.constant = c
            }
        }
        
    }
    
}
