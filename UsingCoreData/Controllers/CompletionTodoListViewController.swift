//
//  CompletionTodoListViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/15.
//

import UIKit

final class CompletionTodoListViewController: UIViewController {
    // MARK: - Properties
    private let coreDataManager = CoreDataManager.shared
    private let mainView = TodoListView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CompletionTodoList"
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    deinit {
        print("CompletionTodoListView Controller 사라집니다~~")
    }
}

// MARK: - UITableView DataSource
extension CompletionTodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.getCompletionTasks().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier, for: indexPath) as? TodoListCell else { return UITableViewCell() }
        let tasks = coreDataManager.getCompletionTasks()
        cell.task = tasks[indexPath.row]
        return cell
    }
}

// MARK: - UITableView Delegate
extension CompletionTodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
