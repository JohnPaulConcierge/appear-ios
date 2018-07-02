//
//  ConstraintProperty.swift
//  Pods
//
//  Created by John Paul on 6/15/18.
//

import Foundation

/**
 ConstraintProperty
 
 When applied, only the constraints of the view and its superview will be affected.
 */
public struct ConstraintProperty: Property, Equatable {

    /**
     The attributes that will be updated.
     */
    public var attributes: [NSLayoutAttribute: CGFloat]

    public init(attributes: [NSLayoutAttribute: CGFloat]) {
        self.attributes = attributes
    }

    /**
     Updates the view's constraints
     
     This function only looks for constraint in the view and the view's superview.
     
     - Parameter view: the view
     */
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

    /// Combines the property with a newer version by simply merging the attributes dictionary.
    /// If the parameter is of another type, then it is simply returned.
    ///
    /// - Parameter property: a property
    public func combined(with property: Property) -> Property {
        guard let cp = property as? ConstraintProperty else {
            return property
        }

        var p = self
        cp.attributes.forEach {
            p.attributes[$0.key] = $0.value
        }
        return p
    }

    public var identifier: String {
        return "Constraint"
    }

}

public func == (lhs: ConstraintProperty, rhs: ConstraintProperty) -> Bool {
    return lhs.attributes == rhs.attributes
}
