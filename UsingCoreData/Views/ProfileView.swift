//
//  ProfileView.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/16.
//

import UIKit

class ProfileView: UIView {
    
    let statusBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "userName"
        label.textColor = .black
        return label
    }()
    
    let rightBarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        button.setImage(UIImage(systemName: "line.3.horizontal", withConfiguration: imageConfig), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let userImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "userPic")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let postsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let followingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    let collectionView: UICollectionView = {
//        let cv = UICollectionView()
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        self.addSubview(statusBarView)
        statusBarView.addSubview(userNameLabel)
        statusBarView.addSubview(rightBarButton)
        self.addSubview(userImageView)
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            statusBarView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 14),
            
            userNameLabel.centerXAnchor.constraint(equalTo: statusBarView.centerXAnchor),
            userNameLabel.centerYAnchor.constraint(equalTo: statusBarView.centerYAnchor),
            
            rightBarButton.trailingAnchor.constraint(equalTo: statusBarView.trailingAnchor, constant: -20),
            rightBarButton.centerYAnchor.constraint(equalTo: statusBarView.centerYAnchor),
            
            userImageView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor, constant: 14),
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            userImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
