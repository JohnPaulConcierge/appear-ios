//
//  Styleable.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import Foundation

protocol Styleable {
    
    associatedtype P: Property
    
    func apply(property: P)
    
}
