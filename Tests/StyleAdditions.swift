//
//  StyleAdditions.swift
//  Appear-Unit-Tests
//
//  Created by John Paul on 6/28/18.
//

import Foundation
@testable import Appear

extension Style: Equatable {

    /// Checks that the properties are the same as the one in the array
    ///
    /// - Parameter properties: properties
    /// - Returns: true if the properties are the same
    public func check(properties: [Property]) -> Bool {

        guard self.properties.count == properties.count else {
            return false
        }

        for (i, lp) in self.properties.enumerated() {

            guard let clp = lp as? ComparableProperty else {
                assert(false)
                return false
            }

            guard clp.equals(property: properties[i]) else {
                return false
            }
        }

        return true
    }

}

public func == (lhs: Style, rhs: Style) -> Bool {
    return lhs.check(properties: rhs.properties)
}

