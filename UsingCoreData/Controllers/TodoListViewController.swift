//
//  TodoListViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

final class TodoListViewController: UIViewController {
    // MARK: - Properties
    private let coreDataManager = CoreDataManager.shared
    private let mainView = TodoListView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TodoList"
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        setNavigationBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    deinit {
        print("TodoListView Controller 사라집니다~~")
    }
    
    // MARK: - Setup
    private func setNavigationBarItem() {
        let image = UIImage(systemName: "plus")
        let addButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationController?.navigationBar.tintColor = .systemPink
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - Show
    private func showAlert() {
        let alert = UIAlertController(title: "할 일 추가하기", message: "새로운 할 일을 입력하세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let add = UIAlertAction(title: "추가", style: .default) { _ in
            if let text = alert.textFields?[0].text {
                self.coreDataManager.create(task: text)
                self.mainView.tableView.reloadData()
            }
        }
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(add)
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    @objc func addButtonTapped() {
        showAlert()
    }
} 

// MARK: - UITableView DataSource
extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.getTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier, for: indexPath) as? TodoListCell else { return UITableViewCell() }
        let tasks = coreDataManager.getTasks()
        cell.task = tasks[indexPath.row]
        return cell
    }
}

// MARK: - UITableView Delegate
extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - TodoListCell Delegate
extension TodoListViewController: TodoListCellDelegate {
    func checkBoxButtonTapped(task: Task) {
        coreDataManager.update(task)
    }
}

