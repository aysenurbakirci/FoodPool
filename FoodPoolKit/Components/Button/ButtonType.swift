//
//  ButtonType.swift
//  FoodPoolKit
//
//  Created by Ayşe Nur Bakırcı on 6.03.2022.
//

import Foundation

public enum ButtonType {
    case primary
    case secondary
    case icon
    case titlePrimary
    case titleSecondary
}

extension ButtonType {
    var appearance: ButtonAppearance {
        switch self {
        case .primary:
            return .primary
        case .secondary:
            return .secondary
        case .icon:
            return.icon
        case .titlePrimary:
            return .titlePrimary
        case .titleSecondary:
            return .titleSecondary
        }
    }
}
