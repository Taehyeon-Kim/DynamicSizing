//
//  ViewController.swift
//  DynamicSizingTableViewCellEx1
//
//  Created by taehy.k on 2022/01/27.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var dataSource: [String] = [
        "test",
        "testtesttesttesttest",
        "testtesttesttesttest\ntesttesttesttesttest",
        "testtesttesttesttest\ntesttesttesttesttest\ntesttesttesttesttest",
        "testtesttesttesttest\ntesttesttesttesttest\ntesttesttesttesttest\ntesttesttesttesttest",
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    ]

    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        registerXibs()
    }
    
    // MARK: - Layout Cycle

    override func viewWillLayoutSubviews() {
        print(#file, #line, #function, "viewWillLayoutSubviews 호출")
    }

    override func viewDidLayoutSubviews() {
        print(#file, #line, #function, "viewDidLayoutSubviews 호출")
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func registerXibs() {
        let nib = UINib(nibName: "SampleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SampleTableViewCell")
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as? SampleTableViewCell else { return UITableViewCell() }
        let sampleModel = SampleModel(message: dataSource[indexPath.row])
        cell.bind(model: sampleModel)
        return cell
    }
}
