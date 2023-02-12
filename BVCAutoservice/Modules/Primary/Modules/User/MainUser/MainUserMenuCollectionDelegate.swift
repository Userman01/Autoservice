//
//  MainUserCollectionDelegate.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 27.12.2022.
//

import UIKit

final class MainUserMenuCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModels: [MainUserMenuViewModel]

    init(viewModels: [MainUserMenuViewModel] = []) {
        representableViewModels = viewModels
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryAttributes = [NSAttributedString.Key.font: UIFont.font12RegularNeuropol as Any]
        let categoryWith = representableViewModels[indexPath.row].tittle.size(withAttributes: categoryAttributes).width + CGFloat.spacing16Pt
        return CGSize(width: categoryWith, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
