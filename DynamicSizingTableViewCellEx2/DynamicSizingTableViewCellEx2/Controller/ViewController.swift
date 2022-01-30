//
//  ViewController.swift
//  DynamicSizingTableViewCellEx2
//
//  Created by taehy.k on 2022/01/28.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        registerXibs()
    }
    
    // MARK: - Set

    func setTableView() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
    }
    
    func registerXibs() {
        let nib = UINib(nibName: "NoticeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoticeTableViewCell")
    }
}

// MARK: - UITableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as? NoticeTableViewCell else { return UITableViewCell() }
        
        if indexPath.row % 2 == 0 {
            cell.buttonStackView.subviews.forEach { $0.isHidden = true }
            cell.isDone = true
        }
        
        return cell
    }
}
