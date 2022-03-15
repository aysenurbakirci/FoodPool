//
//  ViewDisplayer.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import RxSwift
import RxCocoa

public typealias ActivityHandler = ViewModel & RemoteLoading
public typealias ActivityDisplayer = View & ErrorDisplayer & LoadingDisplayer

public protocol ViewModel {}

public protocol View: AnyObject {
    associatedtype VM: ViewModel
    var viewModel: VM { get set }
    var bag: DisposeBag { get }
}

public protocol RemoteLoading {
    var isLoading: BehaviorRelay<Bool> { get }
    var onError: BehaviorRelay<Error?> { get }
}
