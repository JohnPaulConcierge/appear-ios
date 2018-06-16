//
//  StyleableLabel.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import UIKit

/**
 Class to be used with the `TitleAttributesProperty`
 
 - Note: This class resets the `UILabel.attributedText`, avoid using that variable as it may lead to unexpected results.
 */
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
