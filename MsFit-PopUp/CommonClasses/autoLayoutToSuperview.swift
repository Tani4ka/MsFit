//
//  autoLayoutToSuperview.swift
//  MsFit-PopUp
//
//  Created by Tetiana Hranchenko on 25.02.2020.
//  Copyright © 2020 Tatyana Granchenko. All rights reserved.
//
import UIKit
import Foundation

//func autoLayoutToSuperview(_ attributes: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom], inset: CGFloat = 0) -> [NSLayoutConstraint] {
//
//    var constraints: [NSLayoutConstraint] = []
//    translatesAutoresizingMaskIntoConstraints = false
//
//    for attribute in attributes {
//        var constant = inset
//        switch attribute {
//        case .right:
//            constant = -inset
//        case .bottom:
//            constant = -inset
//        default:
//            break
//        }
//
//        let constraint = NSLayoutConstraint(
//            item: self,
//            attribute: attribute,
//            relatedBy: .equal,
//            toItem: self.superview,
//            attribute: attribute,
//            multiplier: 1,
//            constant: constant
//        )
//        self.superview?.addConstraint(constraint)
//        constraints.append(constraint)
//    }
//    return constraints
//}

/*
// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func draw(_ rect: CGRect) {
    // Drawing code
}
*/
