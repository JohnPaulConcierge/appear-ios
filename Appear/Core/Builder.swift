//
//  Builder.swift
//  Appear
//
//  Created by John Paul on 6/28/18.
//

import Foundation

final class Builder {

    let components: [String: [StyleComponent]]

    /// The styles being built
    private(set) var styles: [String: Style] = [:]

    /// A set of styles already computed.
    /// This is to avoid cyclic dependencies.
    private(set) var computedStyles: Set<String> = []

    init(components: [String: [StyleComponent]]) {
        self.components = components
    }

    /// Builds a style and adds it the the dictionary
    ///
    /// - Parameters:
    ///   - name: the name of the style
    ///   - array: the array of components
    /// - Returns: the created style
    func add(name: String, array: [StyleComponent]) -> Style? {

        computedStyles.insert(name)

        var style = Style()

        array.forEach { component in
            switch component {
            case let property as Property:
                style.add(property: property)
            case let name as String:
                if let parent = findOrAdd(name: name) {
                    style = style.combined(with: parent)
                }
            default:
                break
            }
        }

        styles[name] = style

        return style
    }

    func findOrAdd(name: String) -> Style? {

        // Check that this function has not been called with that name yet
        // If we didn't check this, we might have an infinite loop
        guard !computedStyles.contains(name) else {
            return styles[name]
        }

        if let c = components[name] {
            return add(name: name, array: c)
        }

        return nil
    }

    func build() -> [String: Style] {
        styles = [:]

        components.keys.forEach {
            _ = findOrAdd(name: $0)
        }

        return styles

    }

}
