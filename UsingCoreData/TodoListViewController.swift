//
//  TodoListViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

class TodoListViewController: UIViewController {

    override func loadView() {
        let mainView = TodoListView()
        self.view = mainView
        mainView.tableView.register(TodoListCell.self, forCellReuseIdentifier: TodoListCell.identifier)
        mainView.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
} 

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier, for: indexPath) as? TodoListCell else { return UITableViewCell() }
        cell.mainLabel.text = "헤헤헤 화이팅"
        return cell
    }
}
