//
//  OnBoarding.swift
//  FoodPoolAPI
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation

public struct OnBoardingModel: Decodable {
    public var onBoarding: [OnBoarding]
}

public struct OnBoarding: Decodable {
    public var imageName: String
    public var title: String
    public var description: String
}
