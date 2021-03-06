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
            let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
            states.forEach { resetAttributedText(for: $0) }
        }
    }

    open override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)

        if state == .normal {
            // We have to override all states otherwise the attributes won't be displayed properly :(
            resetAllAttributedTexts()
        } else {
            resetAttributedText(for: state)
        }
    }

    open func apply(titleAttributes: TitleAttributesProperty) {
        self.titleAttributes = titleAttributes
    }

    open func resetAllAttributedTexts() {
        for state in [UIControl.State.normal,
                      UIControl.State.highlighted,
                      UIControl.State.disabled,
                      UIControl.State.selected] {
                        resetAttributedText(for: state)
        }
    }

    open func resetAttributedText(for state: UIControl.State) {

        if let a = titleAttributes, let t = title(for: state) ?? title(for: .normal), let s = ControlState.from(state) {
            setAttributedTitle(NSAttributedString(string: a.uppercased ? t.uppercased() : t, attributes: a.attributes?[s]), for: state)
        } else if let t = title(for: state) {
            setAttributedTitle(NSAttributedString(string: t), for: state)
        }
    }
}
