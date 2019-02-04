//
//  BuilderTests.swift
//  Appear-Unit-Tests
//
//  Created by John Paul on 6/28/18.
//

import XCTest
@testable import Appear

class BuilderTests: XCTestCase {

    func testBuildProperties() {

        let ps: [Property] = [ConstraintProperty(attributes: [.left: 40]),
                  BackgroundProperty(kind: .color(.white))]

        let key = "Test"

        let styles = Builder(components: [key: ps]).build()
        XCTAssert(styles[key] == Style(properties: ps))
    }

    func testSimpleParent() {

        let bp1 = BackgroundProperty(kind: .color(.white))
        let bp2 = BackgroundProperty(kind: .color(.green))
        let cp1 = ConstraintProperty(attributes: [.height: 100])

        let styles = Builder(components: [
            "Test1": [bp1],
            "Test2": ["Test1", bp2],
            "Test0": ["Test1", cp1],
            "TestX": [cp1, "Test1"],
            "Te": [cp1, "Test1", "TestX"]
            ]).build()

        XCTAssert(styles["Test1"]?.check(properties: [bp1]) ?? false)
        XCTAssert(styles["Test2"]?.check(properties: [bp1.combined(with: bp2)]) ?? false)
        XCTAssert(styles["Test0"]?.check(properties: [bp1, cp1]) ?? false)
        XCTAssert(styles["TestX"]?.check(properties: [cp1, bp1]) ?? false)
        XCTAssert(styles["Te"]?.check(properties: [cp1, bp1]) ?? false)

    }

}
