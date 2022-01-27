//
//  SampleTableViewCell.swift
//  DynamicSizingTableViewCellEx1
//
//  Created by taehy.k on 2022/01/27.
//

import UIKit

final class SampleTableViewCell: UITableViewCell {

    // MARK: - UI
    
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Bind
    
    public func bind(model: SampleModel) {
        messageLabel.text = model.message
    }
}
