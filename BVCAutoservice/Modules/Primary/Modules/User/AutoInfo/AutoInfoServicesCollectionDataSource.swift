//
//  AutoInfoServicesDataSource.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit

final class AutoInfoServicesCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    weak var delegate: AutoInfoViewControllerDelegate?

    var representableViewModels: [String]

    init(viewModels: [String] = []) {
        self.representableViewModels = viewModels
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.representableViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithRegistration(type: AutoInfoServicesTextCell.self, indexPath: indexPath)
        guard let viewModel = representableViewModels[safe: indexPath.row] else { return cell }
        cell.configure(with: viewModel)
        return cell
    }
}

