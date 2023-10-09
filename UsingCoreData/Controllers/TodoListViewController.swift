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
    deinit {
        print("TodoListView Controller 사라집니다~~")
    }
    
    // MARK: - Setup
    private func setNavigationBarItem() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationController?.navigationBar.tintColor = .systemPink
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - Show Alert
    private func showAlert(title: String?, actionTitile: String?, placeholder: String?, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: "새로운 할 일을 입력하세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let add = UIAlertAction(title: actionTitile, style: .default) { _ in
            if let text = alert.textFields?[0].text {
                completionHandler(text)
            }
        }
        alert.addTextField() { textField in
            textField.placeholder = placeholder
        }
        alert.addAction(cancel)
        alert.addAction(add)
        present(alert, animated: true)
    }
    
    // MARK: - Show EditActionSheet
    private func showEditActionSheet(edit task: Task) {
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let update = UIAlertAction(title: "수정", style: .default) { [weak self] _ in
            self?.showAlert(title: "할 일 수정하기", actionTitile: "수정", placeholder: task.title) { text in
                self?.coreDataManager.update(task, updateTitle: text)
                self?.mainView.tableView.reloadData()
            }
        }
        let delete = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
            self?.coreDataManager.delete(task: task)
            self?.mainView.tableView.reloadData()
        }
        sheet.addAction(cancel)
        sheet.addAction(update)
        sheet.addAction(delete)
        present(sheet, animated: true)
    }
    
    // MARK: - Actions
    @objc private func addButtonTapped() {
        showAlert(title: "새로운 할 일", actionTitile: "추가", placeholder: "할 일을 입력하세요.") { text in
            self.coreDataManager.create(task: text)
            self.mainView.tableView.reloadData()
        }
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
} 

// MARK: - UITableView DataSource
extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do {
            let tasks = try coreDataManager.getTasks()
            return tasks.count
        } catch {
            print("ERROR: Get Tasks Failed")
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier, for: indexPath) as? TodoListCell else { return UITableViewCell() }
        do {
            let tasks = try coreDataManager.getTasks()
            cell.task = tasks[indexPath.row]
            cell.delegate = self
            return cell
        } catch {
            print("ERROR: Get Tasks Failed")
        }
        return UITableViewCell()
    }
}

// MARK: - UITableView Delegate
extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let tasks = try coreDataManager.getTasks()
            let task = tasks[indexPath.row]
            showEditActionSheet(edit: task)
        } catch {
            print("ERROR: Get Tasks Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - TodoListCell Delegate
extension TodoListViewController: TodoListCellDelegate {
    func checkBoxButtonTapped(task: Task, isCompleted: Bool) {
        coreDataManager.update(task, isCompleted: isCompleted)
    }
}

