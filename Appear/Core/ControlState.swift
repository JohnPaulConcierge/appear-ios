//
//  File.swift
//  Appear
//
//  Created by John Paul on 6/15/18.
//

import Foundation

/**
 An enum representing control states.
 This is required because UIControlState does not implement the Hashable protocol and making a UIControlState extension may result in conflicts.
 */
public enum ControlState: String {

    case normal
    case highlighted
    case selected
    case disabled

    public var uiControlState: UIControl.State {
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

    public static func from(_ state: UIControl.State) -> ControlState? {
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
