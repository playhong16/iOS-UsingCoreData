//
//  TodoListCell.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

protocol TodoListCellDelegate: AnyObject {
    func checkBoxButtonTapped(task: Task, isCompleted: Bool)
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
    private let checkBoxImage = UIImage(systemName: "square")
    private let checkBoxTappedImage = UIImage(systemName: "checkmark.square")

    // MARK: - Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    private let modifyDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    private lazy var taskInfo: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, modifyDateLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        return sv
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
        titleLabel.strikethrough(from: self.task?.title, at: 0)
        modifyDateLabel.text = ""
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        contentView.addSubview(taskInfo)
        contentView.addSubview(checkBoxButton)
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            taskInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taskInfo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            checkBoxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            checkBoxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Setup
    private func setTaskData() {
        guard let task = self.task else { return }
        titleLabel.text = task.title
        if let modifyDate = task.modifyDate {
            modifyDateLabel.text = "update: \(dateFormatter(task.modifyDate))"
        }
        setCompletedStatus()
    }
    
    private func setCompletedStatus() {
        guard let task = self.task else { return }
        if task.isCompleted == true {
            checkBoxButton.setImage(checkBoxTappedImage, for: .normal)
            titleLabel.strikethrough(from: task.title, at: task.title?.count)
        }
        if task.isCompleted == false {
            checkBoxButton.setImage(checkBoxImage, for: .normal)
            titleLabel.strikethrough(from: task.title, at: 0)
        }
    }
    
    private func dateFormatter(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm"
        let dateStr = formatter.string(from: date)
        return dateStr
    }
    
    
    // MARK: - Actions
    @objc private func checkBoxButtonTapped() {
        guard let task = self.task else { return }
        task.isCompleted.toggle()
        setCompletedStatus()
        delegate?.checkBoxButtonTapped(task: task, isCompleted: task.isCompleted)
    }
}
