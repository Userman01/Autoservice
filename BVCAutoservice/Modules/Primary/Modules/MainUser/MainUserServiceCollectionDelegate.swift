//
//  MainUserServiceCollectionDelegate.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.12.2022.
//

import UIKit

final class MainUserServiceCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModels: [MainUserServicesViewModel]

    init(viewModels: [MainUserServicesViewModel] = []) {
        representableViewModels = viewModels
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.contentSize.height)
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat.spacing12Pt
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
