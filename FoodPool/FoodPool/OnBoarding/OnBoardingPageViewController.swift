//
//  OnBoardingPageViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 28.02.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import LayoutKit
import FoodPoolKit
import FoodPoolAPI

final class OnBoardingPageViewController: UIViewController {
    
    lazy var onBoardingView = OnBoardingPageView()
    var viewModel: OnBoardingPageViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onBoardingView.source = self
        view = onBoardingView
        viewModel.loadData()
        onBoardingView.numberOfPages = viewModel.dataCount()
    }
}

extension OnBoardingPageViewController: UICollectionViewDelegate {}

extension OnBoardingPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataCount()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: OnBoardingPageCell = collectionView.dequeue(for: indexPath)
        let model = viewModel.getModel(to: indexPath.row)
        cell.apply(image: UIImage(systemName: model.imageName),
                   title: model.title,
                   description: model.description)
        return cell
    }
}

extension OnBoardingPageViewController {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        onBoardingView.currentPage = Int(x / view.frame.width)
    }
}

extension OnBoardingPageViewController {
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate { _ in
            self.onBoardingView.invalidateLayout()
            
            let indexPath = IndexPath(item: self.onBoardingView.currentPage,
                                      section: 0)
            self.onBoardingView.scrollToItem(indexPath: indexPath,
                                             scrollPosition: .centeredHorizontally)
        } completion: { _ in
            
        }
    }
}

extension OnBoardingPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
