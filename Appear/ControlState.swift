//
//  File.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import Foundation

public enum ControlState: String {
    
    case normal
    case highlighted
    case selected
    case disabled
    
    public var uiControlState: UIControlState {
        switch self {
        case .normal:
            return .normal
        case .highlighted:
            return .highlighted
        case .selected:
            return .selected
        case .disabled:
            return .disabled
        }
    }
    
    public static func from(_ state: UIControlState) -> ControlState? {
        switch state {
        case .normal:
            return .normal
        case .highlighted:
            return .highlighted
        case .selected:
            return .selected
        case .disabled:
            return .disabled
        default:
            return nil
        }
    }
    
}