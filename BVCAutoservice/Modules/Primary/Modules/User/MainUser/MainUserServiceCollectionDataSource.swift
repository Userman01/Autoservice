//
//  MainUserServiceCollectionDataSource.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.12.2022.
//

import UIKit

final class MainUserServiceCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModels: [MainUserServicesViewModel]

    init(viewModels: [MainUserServicesViewModel] = []) {
        self.representableViewModels = viewModels
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.representableViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithRegistration(type: MainUserServiceInfoCell.self, indexPath: indexPath)
        guard let viewModel = representableViewModels[safe: indexPath.row] else { return cell }
        cell.configure(with: viewModel)
        return cell
    }
}
