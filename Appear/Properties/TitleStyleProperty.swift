//
//  TitleAttributesProperty.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import Foundation

public protocol TitleAttributesStyleable {

    func apply(titleAttributes: TitleAttributesProperty)

}

/**
 TitleAttributesProperty
 
 Advanced text attributes control.
 
 This property is ignored on all UIKit components.
 To use your custom control needs to conform to `TitleAttributesStyleable`
 */
public struct TitleAttributesProperty: Property {

    public var attributes: [ControlState: [NSAttributedString.Key: Any]]?

    public var uppercased: Bool

    public init(attributes: [ControlState: [NSAttributedString.Key: Any]]? = nil, uppercased: Bool = false, useNormalAsDefault: Bool = true) {

        if useNormalAsDefault, let a = attributes, let normal = a[.normal] {

            func merge(state: ControlState) -> [NSAttributedString.Key: Any] {
                var d = normal
                a[state]?.forEach {
                    d[$0.key] = $0.value
                }
                return d
            }

            self.attributes = [
                .normal: normal,
                .highlighted: merge(state: .highlighted),
                .selected: merge(state: .selected),
                .disabled: merge(state: .disabled)
            ]

        } else {
            self.attributes = attributes
        }
        self.uppercased = uppercased
    }

    public func apply(view: UIView) {
        if let s = view as? TitleAttributesStyleable {
            s.apply(titleAttributes: self)
        }
    }

    /// Combines the property with a newer version by recursively merging the `attributes` dictionary.
    /// If the parameter is of another type, then it is simply returned.
    ///
    /// - Parameter property: a property
    public func combined(with property: Property) -> Property {

        guard let tp = property as? TitleAttributesProperty else {
            return property
        }

        var p = self
        p.uppercased = tp.uppercased

        switch (p.attributes, tp.attributes) {
        case (nil, _):
            p.attributes = tp.attributes
        case (_, nil):
            break
        case (.some(let old), .some(let new)):

            p.attributes = old
            new.forEach { tuple0 in
                // First level merge
                if var dictionary = old[tuple0.key] {

                    // Second level merge
                    tuple0.value.forEach { tuple1 in
                        dictionary[tuple1.key] = tuple1.value
                    }
                    p.attributes?[tuple0.key] = dictionary

                } else {
                    p.attributes?[tuple0.key] = tuple0.value
                }
            }   
        }
        return p
    }

    public var identifier: String {
        return "TitleStyle"
    }

}
