//
//  UpdateSpacer.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 09.01.2023.
//

import UIKit

extension UITableView {
    
    private var spacedTableView: SpacedTableView? {
        return self as? SpacedTableView
    }
    
    func reloadSpacer() {
        guard let superview = superview,
              let lastIndexPath = getLastIndexPath(),
              let spacerIndexPath = getSpacerIndexPath(lastIndexPath: lastIndexPath),
              cellForRow(at: spacerIndexPath) is SpacerCell else { return }
        if spacedTableView?.initialContentOffset == nil {
            spacedTableView?.initialContentOffset = contentOffset.y
        }
        let previousSpacerHeight: CGFloat = getSpacerHeight()
        let lastCellRectInTableView: CGRect = rectForRow(at: lastIndexPath).offsetBy(dx: .zero, dy: -previousSpacerHeight)
        let lastCellRectInSuperview: CGRect = convert(lastCellRectInTableView, to: superview)
        let targetHeight: CGFloat = superview.frame.maxY - superview.safeAreaInsets.bottom - getContentOffsetDiff()
        let diff: CGFloat = targetHeight - lastCellRectInSuperview.maxY
        setSpacerHeight(value: diff)
        UIView.performWithoutAnimation { [weak self] in
            self?.reloadRows(at: [spacerIndexPath], with: .none)
        }
    }
    
    private func getLastIndexPath() -> IndexPath? {
        let lastSection: Int = numberOfSections - 1
        guard lastSection >= 0 else { return nil }
        let lastRow: Int = numberOfRows(inSection: lastSection) - 1
        guard lastRow >= 0 else { return nil }
        return IndexPath(row: lastRow, section: lastSection)
    }
    
    private func getSpacerIndexPath(lastIndexPath: IndexPath) -> IndexPath? {
        for section in (0..<numberOfSections).reversed() {
            for row in (0..<numberOfRows(inSection: section)).reversed() {
                let indexPath = IndexPath(row: row, section: section)
                if cellForRow(at: indexPath) is SpacerCell {
                    return indexPath
                }
            }
        }
        return nil
    }
    
    func getSpacerHeight() -> CGFloat {
        spacedTableView?.space ?? .zero
    }
    
    func setSpacerHeight(value: CGFloat) {
        spacedTableView?.space = value < 0 ? 0 : value
    }
    
    private func getContentOffsetDiff() -> CGFloat {
        if let initialContentOffset = spacedTableView?.initialContentOffset, contentOffset.y > initialContentOffset {
            return contentOffset.y - initialContentOffset
        }
        return 0
    }
}
