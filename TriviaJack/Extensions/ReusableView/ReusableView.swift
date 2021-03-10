//
//  ReusableView.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//

import Foundation

protocol Reusable: class {
    static var reuseIdentifier: String { get }
    static var nib: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return nib
    }
    static var nib: String {
        return String(describing: self)
    }
}
