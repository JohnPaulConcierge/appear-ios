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
    
    public var attributes: [ControlState: [NSAttributedStringKey: Any]]?
    
    public var uppercased: Bool
    
    public init(attributes: [ControlState: [NSAttributedStringKey: Any]]?, uppercased: Bool = false, useNormalAsDefault: Bool = true) {
        
        if useNormalAsDefault, let a = attributes, let normal = a[.normal] {
            
            func merge(state: ControlState) -> [NSAttributedStringKey: Any] {
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
                .disabled: merge(state: .disabled),
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
    
}
