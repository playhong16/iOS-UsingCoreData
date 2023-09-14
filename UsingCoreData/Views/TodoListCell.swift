//
//  TodoListCell.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

final class TodoListCell: UITableViewCell {
    // MARK: - Static Properties
    static let identifier = "TodoListCell"

    // MARK: - Components
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        contentView.addSubview(mainLabel)
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
