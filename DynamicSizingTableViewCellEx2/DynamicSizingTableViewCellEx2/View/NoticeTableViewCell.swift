//
//  NoticeTableViewCell.swift
//  DynamicSizingTableViewCellEx2
//
//  Created by taehy.k on 2022/01/28.
//

import UIKit

final class NoticeTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    var isDone: Bool = false {
        didSet {
            updateUI()
        }
    }

    // MARK: - UI
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var noticeIcon: UIImageView!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var buttonStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonStackViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Overriding
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        style()
        updateUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // ✅ 테이블뷰에서 inset을 주고 싶다면 다음과 같은 방법을 사용할 수 있음
        // ✅ Line Spacing도 줄 수 있으나 본 예제에서는 Constraint 문제가 있어 사용하지 않음
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    // MARK: - Set
    
    func style() {
        backgroundColor = .systemGray6
        contentView.backgroundColor = .clear
        containerView.layer.cornerRadius = 12
        buttonStackView.subviews.forEach { $0.layer.cornerRadius = 12 }
    }
    
    func updateUI() {
        buttonStackViewHeightConstraint.constant = isDone ? 0 : 40
        buttonStackViewTopConstraint.constant = isDone ? 0 : 16
    }
}
