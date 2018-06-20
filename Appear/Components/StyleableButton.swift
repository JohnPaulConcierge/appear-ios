//
//  StyleableButton.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import UIKit

/**
 Class to be used with the `TitleAttributesProperty`
 
 - Note: This class hijacks the `UIButton.setAttributedTitle(:,for:)` function, avoid using it as it may lead to unexpected results.
 */
open class StyleableButton: UIButton, TitleAttributesStyleable {

    open var titleAttributes: TitleAttributesProperty? {
        didSet {
            let states: [UIControlState] = [.normal, .highlighted, .selected, .disabled]
            states.forEach { resetAttributedText(for: $0) }
        }
    }

    open override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: state)

        resetAttributedText(for: state)
    }

    open func apply(titleAttributes: TitleAttributesProperty) {
        self.titleAttributes = titleAttributes
    }

    open func resetAttributedText(for state: UIControlState) {

        if let a = titleAttributes, let t = title(for: state), let s = ControlState.from(state) {
            setAttributedTitle(NSAttributedString(string: a.uppercased ? t.uppercased() : t, attributes: a.attributes?[s]), for: state)
        } else {
            setAttributedTitle(nil, for: state)
        }
    }
}
