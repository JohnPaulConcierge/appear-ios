//
//  TitleProperty.swift
//  Appear
//
//  Created by John Paul on 7/9/18.
//

import Foundation


/// Controls the title (image and text) of a button, label or image
public struct TitleProperty: Property {

    public var images: [ControlState: UIImage]

    public var texts: [ControlState: String]

    public init(images: [ControlState: UIImage] = [:], texts: [ControlState: String] = [:]) {
        self.images = images
        self.texts = texts
    }

    public var identifier: String {
        return "Title"
    }

    public func apply(view: UIView) {
        switch view {
        case let u as UIImageView:
            u.image = images[.normal]
            u.highlightedImage = images[.highlighted]
        case let l as UILabel:
            l.text = texts[.normal]
        case let b as UIButton:
            images.forEach {
                b.setImage($0.value, for: $0.key.uiControlState)
            }
            texts.forEach {
                b.setTitle($0.value, for: $0.key.uiControlState)
            }
        default:
            break
        }
        
    }
    
}
