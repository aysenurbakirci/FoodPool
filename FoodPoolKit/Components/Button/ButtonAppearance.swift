//
//  ButtonAppearance.swift
//  FoodPoolKit
//
//  Created by Ayşe Nur Bakırcı on 6.03.2022.
//

import Foundation
import UIKit

struct ButtonAppearance {
    let titleColor: UIColor
    let imageColor: UIColor
    let backgroundColor: UIColor
    let borderColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let font: UIFont
    let verticalAlignment: UIControl.ContentVerticalAlignment
    let horizontalAlignment: UIControl.ContentHorizontalAlignment
}

extension ButtonAppearance {
    static let primary = ButtonAppearance(
        titleColor: .white,
        imageColor: .white,
        backgroundColor: .mainColor,
        borderColor: .clear,
        cornerRadius: 10.0,
        borderWidth: 0.0,
        font: .boldMedium,
        verticalAlignment: .center,
        horizontalAlignment: .center
    )
    
    static let secondary = ButtonAppearance(
        titleColor: .mainColor,
        imageColor: .mainColor,
        backgroundColor: .white,
        borderColor: .mainColor,
        cornerRadius: 10.0,
        borderWidth: 2.0,
        font: .boldMedium,
        verticalAlignment: .center,
        horizontalAlignment: .center
    )
    
    static let icon = ButtonAppearance(
        titleColor: .clear,
        imageColor: .mainColor,
        backgroundColor: .clear,
        borderColor: .clear,
        cornerRadius: 0.0,
        borderWidth: 0.0,
        font: .boldMedium,
        verticalAlignment: .center,
        horizontalAlignment: .center
    )
    
    static let titlePrimary = ButtonAppearance(
        titleColor: .mainColor,
        imageColor: .mainColor,
        backgroundColor: .clear,
        borderColor: .clear,
        cornerRadius: 0.0,
        borderWidth: 0.0,
        font: .boldMedium,
        verticalAlignment: .center,
        horizontalAlignment: .center
    )
    
    static let titleSecondary = ButtonAppearance(
        titleColor: .lightGray,
        imageColor: .lightGray,
        backgroundColor: .clear,
        borderColor: .clear,
        cornerRadius: 0.0,
        borderWidth: 0.0,
        font: .boldSmall,
        verticalAlignment: .center,
        horizontalAlignment: .center
    )
}
