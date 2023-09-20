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
        let image = UIImage(systemName: "plus")
        let addButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationController?.navigationBar.tintColor = .systemPink
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - Show
    private func showAlert(title: String, actionTitile: String, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: "새로운 할 일을 입력하세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let add = UIAlertAction(title: actionTitile, style: .default) { _ in
            if let text = alert.textFields?[0].text {
                completionHandler(text)
            }
        }
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(add)
        present(alert, animated: true)
    }
    
    private func showSheet(edit task: Task) {
        let sheet = UIAlertController(title: "편집하기", message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let add = UIAlertAction(title: "수정", style: .default) { [weak self] _ in
            self?.showAlert(title: "할 일 수정하기", actionTitile: "수정") { text in
                self?.coreDataManager.update(task, updateTitle: text)
                self?.mainView.tableView.reloadData()
            }
        }
        let delete = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
            self?.coreDataManager.delete(task: task)
            self?.mainView.tableView.reloadData()
        }
        sheet.addAction(cancel)
        sheet.addAction(add)
        sheet.addAction(delete)
        present(sheet, animated: true)
    }
    
    // MARK: - Actions
    @objc func addButtonTapped() {
        showAlert(title: "새로운 할 일", actionTitile: "추가") { text in
            self.coreDataManager.create(task: text)
            self.mainView.tableView.reloadData()
        }
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
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableView Delegate
extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = coreDataManager.getTasks()[indexPath.row]
        showSheet(edit: task)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - TodoListCell Delegate
extension TodoListViewController: TodoListCellDelegate {
    func checkBoxButtonTapped(task: Task) {
//        coreDataManager.update(task)
    }
}

