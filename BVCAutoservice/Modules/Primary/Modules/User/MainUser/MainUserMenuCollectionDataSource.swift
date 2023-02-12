//
//  MainUserCollectionDataSource.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 27.12.2022.
//

import UIKit

final class MainUserMenuCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModels: [MainUserMenuViewModel]

    init(viewModels: [MainUserMenuViewModel] = []) {
        self.representableViewModels = viewModels
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.representableViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithRegistration(type: MainUserMenuTextCell.self, indexPath: indexPath)
        guard let viewModel = representableViewModels[safe: indexPath.row] else { return cell }
        cell.configure(with: viewModel)
        return cell
    }
}
