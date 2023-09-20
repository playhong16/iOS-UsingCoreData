//
//  TodoListCell.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

protocol TodoListCellDelegate: AnyObject {
    func checkBoxButtonTapped(task: Task)
}

final class TodoListCell: UITableViewCell {
    // MARK: - Type Properties
    static let identifier = "TodoListCell"
    
    // MARK: - Properties
    weak var delegate: TodoListCellDelegate?
    var task: Task? {
        didSet { setTaskData() }
    }
    
    // MARK: - Constans
    let checkBoxImage = UIImage(systemName: "square")
    let checkBoxTappedImage = UIImage(systemName: "checkmark.square")

    // MARK: - Components
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(checkBoxImage, for: .normal)
        button.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        mainLabel.strikethrough(from: self.task?.title, at: 0)
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        contentView.addSubview(mainLabel)
        contentView.addSubview(checkBoxButton)
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            checkBoxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            checkBoxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Setup
    private func setTaskData() {
        guard let task = self.task else { return }
        mainLabel.text = task.title
        if task.isCompleted == true {
            checkBoxButton.setImage(checkBoxTappedImage, for: .normal)
            mainLabel.strikethrough(from: task.title, at: task.title?.count)
        }
        
        if task.isCompleted == false {
            checkBoxButton.setImage(checkBoxImage, for: .normal)
            mainLabel.strikethrough(from: task.title, at: 0)
        }
    }
    
    // MARK: - Actions
    @objc func checkBoxButtonTapped() {
        guard let task = self.task else { return }
        task.isCompleted.toggle()
        if task.isCompleted == true {
            checkBoxButton.setImage(checkBoxTappedImage, for: .normal)
            mainLabel.strikethrough(from: task.title, at: task.title?.count)
        }
        if task.isCompleted == false {
            checkBoxButton.setImage(checkBoxImage, for: .normal)
            mainLabel.strikethrough(from: task.title, at: 0)
        }
        delegate?.checkBoxButtonTapped(task: task)
    }
}
