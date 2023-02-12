//
//  AutoInfoServicesDelegate.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit

final class AutoInfoServicesCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModels: [String]

    init(viewModels: [String] = []) {
        representableViewModels = viewModels
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryAttributes = [NSAttributedString.Key.font: UIFont.font12Regular as Any]
        let categoryWith = representableViewModels[indexPath.row].description.size(withAttributes: categoryAttributes).width + CGFloat.spacing32Pt
        let categoryHeight = representableViewModels[indexPath.row].description.size(withAttributes: categoryAttributes).height + CGFloat.spacing16Pt
        return CGSize(width: categoryWith, height: categoryHeight)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
