//
//  HomeView.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/13.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Constants
    let todoListButtonTitle = "할일 확인하기"
    let completionButtonTitle = "완료한일 보기"
    let profileButtonTitle = "프로필 보기"
    
    // MARK: - Components
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var showTodoListButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(self.todoListButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showTodoListButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var showCompletionTodoListButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(self.completionButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showCompletionTodoListButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var showProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(self.profileButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showProfileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    // MARK: - addSubViews
    func addSubviews() {
        self.addSubview(mainImageView)
        self.addSubview(showTodoListButton)
        self.addSubview(showCompletionTodoListButton)
        self.addSubview(showProfileButton)
    }
    
    // MARK: - Constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            mainImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 200),
            mainImageView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            showTodoListButton.topAnchor.constraint(equalTo: self.mainImageView.bottomAnchor, constant: 40),
            showTodoListButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            showCompletionTodoListButton.topAnchor.constraint(equalTo: self.showTodoListButton.bottomAnchor, constant: 40),
            showCompletionTodoListButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            showProfileButton.topAnchor.constraint(equalTo: self.showCompletionTodoListButton.bottomAnchor, constant: 40),
            showProfileButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    // MARK: - Configure
    func configure() {
        self.backgroundColor = .white
    }
    
    // MARK: - Actions
    @objc func showTodoListButtonTapped() {
        
    }
    
    @objc func showCompletionTodoListButtonTapped() {
        
    }
    
    @objc func showProfileButtonTapped() {
        
    }

}
