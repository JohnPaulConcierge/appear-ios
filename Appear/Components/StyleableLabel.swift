//
//  StyleableLabel.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import UIKit

open class StyleableLabel: UILabel, TitleAttributesStyleable {
    
    open var titleAttributes: TitleAttributesProperty? {
        didSet {
            resetAttributedText()
        }
    }
    
    open override var text: String? {
        didSet {
            resetAttributedText()
        }
    }
    
    open func apply(titleAttributes: TitleAttributesProperty) {
        self.titleAttributes = titleAttributes
    }
    
    open func resetAttributedText() {
        
        if let a = titleAttributes, let t = text {
            attributedText = NSAttributedString(string: a.uppercased ? t.uppercased() : t, attributes: a.attributes?[.normal])
        } else {
            attributedText = nil
        }
    }
    
}
