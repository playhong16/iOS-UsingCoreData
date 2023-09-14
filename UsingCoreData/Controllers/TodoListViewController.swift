//
//  TodoListViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

class TodoListViewController: UIViewController {
    
    private let coreDataManager = CoreDataManager.shared

    override func loadView() {
        let mainView = TodoListView()
        self.view = mainView
        mainView.tableView.register(TodoListCell.self, forCellReuseIdentifier: TodoListCell.identifier)
        mainView.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TodoList"
        setNavigationBarItem()
    }
    
    private func setNavigationBarItem() {
        let image = UIImage(systemName: "plus")
        let addButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationController?.navigationBar.tintColor = .systemPink
//        navigationController?.navigationItem.rightBarButtonItem = addButton
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        coreDataManager.create()
    }
} 

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.getTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier, for: indexPath) as? TodoListCell else { return UITableViewCell() }
        let tasks = coreDataManager.getTasks()
        cell.mainLabel.text = tasks[indexPath.row].title
        return cell
    }
}
