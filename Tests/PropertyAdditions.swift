//
//  PropertyAdditions.swift
//  Appear-Unit-Tests
//
//  Created by John Paul on 6/28/18.
//

import Foundation
@testable import Appear

public protocol ComparableProperty: Property {

    /// This is an alternative to the Equatable protocol
    ///
    /// Conforming to the equatable protocol would add a Self requirement and complicate things a lot more.
    ///
    /// - Parameter property: A property to comparte to
    /// - Returns: True if they are the same
    func equals(property: Property) -> Bool
}

extension BackgroundProperty: ComparableProperty {

    public func equals(property: Property) -> Bool {
        if let bp = property as? BackgroundProperty {
            return self == bp
        } else {
            return false
        }
    }

}

extension ConstraintProperty: ComparableProperty {

    public func equals(property: Property) -> Bool {
        if let bp = property as? ConstraintProperty {
            return self == bp
        } else {
            return false
        }
    }

}

extension FontProperty: ComparableProperty {

    public func equals(property: Property) -> Bool {
        if let bp = property as? FontProperty {
            return self == bp
        } else {
            return false
        }
    }
}

extension TitleColorProperty: ComparableProperty {

    public func equals(property: Property) -> Bool {
        if let bp = property as? TitleColorProperty {
            return self == bp
        } else {
            return false
        }
    }
}

