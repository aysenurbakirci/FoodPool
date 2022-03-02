//
//  ProfileView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 23.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class ProfileView: UIView {
    
    //MARK: - Properties
    private lazy var userImage: UIImageView = .create(
        image: .user,
        contentMode: .scaleAspectFit,
        isUserInteractionEnabled: false,
        backgroundColor: .clear,
        tintColor: .gray,
        isOpaque: true
    )
    
    private lazy var name: UILabelView = .create(
        lblText: "Name Surname",
        font: .boldXLarge,
        textColor: .mainColor,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    private lazy var mail: UILabelView = .create(
        lblText: "example@example.com",
        font: .medium,
        textColor: .secondaryTitle,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    private lazy var phone: UILabelView = .create(
        lblText: "Phone",
        font: .medium,
        textColor: .secondaryTitle,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    private lazy var labelStack: UIStackView = .create(
        subviews: [name, mail, phone],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .center,
        spacing: 5
    )
    
    //MARK: - Initalization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configuration
    private func configuration() {
        userImage.addCornerRadius(radius: userImage.bounds.height / 2)
        userImage.aspect(ratio: 1)
        
        addSubviews(userImage, labelStack)
        
        userImage.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         trailing: trailingAnchor)
        labelStack.anchor(top: userImage.bottomAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor)
    }
    
    //MARK: - Apply Model
    public func apply(image: UIImage? = nil,
                      userName: String,
                      email: String = "",
                      phone: String) {
        if let image = image {
            self.userImage.image = image
        }
        self.name.text = userName
        self.mail.text = email
        self.phone.text = phone
    }
    
}
