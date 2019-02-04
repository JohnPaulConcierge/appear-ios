//
//  StyleTests.swift
//  Appear-Unit-Tests
//
//  Created by John Paul on 6/27/18.
//

import XCTest
@testable import Appear

class StyleTests: XCTestCase {

    /// Tests that it remains the same when combined with itself
    func testCombine() {

        let style = Style(properties: [
            BackgroundProperty(kind: .color(.white)),
            ConstraintProperty(attributes: [.height: 100])])

        XCTAssert(style.combined(with: style) == style)
    }

    /// Tests adding properties
    func testAdd() {

        let bp1 = BackgroundProperty(kind: .color(.white))
        let bp2 = BackgroundProperty(kind: .color(.green))

        var style = Style(properties: [bp1])
        style.add(property: bp2)

        XCTAssert(style.check(properties: [bp1.combined(with: bp2)]))

        let cp1 = ConstraintProperty(attributes: [.height: 100])
        style.add(property: cp1)

        XCTAssert(style.check(properties: [bp1.combined(with: bp2), cp1]))
    }

}
