//
//  ProfileView.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/16.
//

import UIKit

final class ProfileView: UIView {
    
    // MARK: - Constants
    private let countLabelFontSize: CGFloat = 20
    private let collectionViewCellSize: CGFloat = (UIScreen.main.bounds.width - 4) / 3
    
// MARK: - Components
    // MARK: - statusBar
    private let statusBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "userName"
        label.textColor = .black
        return label
    }()
    
    private let rightBarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        button.setImage(UIImage(systemName: "line.3.horizontal", withConfiguration: imageConfig), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let userImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "userPic")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // MARK: - posts
    private lazy var postsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: countLabelFontSize)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let postsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "post"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var postsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [postsCountLabel, postsLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 3
        return sv
    }()
    
    // MARK: - followers
    private lazy var followersCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: countLabelFontSize)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "follower"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followersStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followersCountLabel, followersLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 3
        return sv
    }()
    
    // MARK: - following
    private lazy var followingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: countLabelFontSize)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "following"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followingCountLabel, followingLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 3
        return sv
    }()
    
    // MARK: - UserFollowInfo
    private lazy var userFollowInfo: UIStackView = {
        let sv  = UIStackView(arrangedSubviews: [postsStackView, followersStackView, followingStackView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    // MARK: - userInfo
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "르탄이"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Developer 🍎"
        label.textColor = .black
        return label
    }()
    
    private let linkInBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "spartacodingclub.kr"
        label.textColor = .black
        return label
    }()
    
    lazy var userInfo: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [nameLabel, bioLabel, linkInBioLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 3
        return sv
    }()
    
    // MARK: - middleBar
    private let followButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Follow"), for: .normal)
        return button
    }()
    
    private let messageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Message"), for: .normal)
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "More"), for: .normal)
        return button
    }()
    
    private lazy var followAndMessageButton: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followButton, messageButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    private lazy var middleBar: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followAndMessageButton, moreButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    private let divider: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Divider")
        return iv
    }()
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Grid"), for: .normal)
        return button
    }()
    
    private let underLine: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Section indicator")
        return iv
    }()
    
    private lazy var grid: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [gridButton, underLine])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 0
        return sv
    }()
    
    lazy var navGallery: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [divider, grid])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .leading
        sv.spacing = 0
        return sv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionViewCellSize, height: collectionViewCellSize)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let tabBarDivider: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Divider")
        return iv
    }()
    
    private let tabBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var tabBar: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [tabBarDivider, tabBarView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .leading
        sv.spacing = 0
        return sv
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubViews()
        setConstraints()
        setCollectionView()
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
        self.addSubview(statusBar)
        statusBar.addSubview(userNameLabel)
        statusBar.addSubview(rightBarButton)
        self.addSubview(userImageView)
        self.addSubview(userFollowInfo)
        self.addSubview(userInfo)
        self.addSubview(middleBar)
        self.addSubview(navGallery)
        self.addSubview(collectionView)
        self.addSubview(tabBar)
        tabBar.addSubview(profileButton)
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        let barHeight = UIScreen.main.bounds.height / 16
        NSLayoutConstraint.activate([
            statusBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            statusBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            statusBar.heightAnchor.constraint(equalToConstant: barHeight),
            
            userNameLabel.centerXAnchor.constraint(equalTo: statusBar.centerXAnchor),
            userNameLabel.centerYAnchor.constraint(equalTo: statusBar.centerYAnchor),
            
            rightBarButton.trailingAnchor.constraint(equalTo: statusBar.trailingAnchor, constant: -20),
            rightBarButton.centerYAnchor.constraint(equalTo: statusBar.centerYAnchor),
            
            userImageView.topAnchor.constraint(equalTo: statusBar.bottomAnchor),
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
        
            userFollowInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28),
            userFollowInfo.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            
            userInfo.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 14),
            userInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            
            moreButton.widthAnchor.constraint(equalToConstant: 30),
            moreButton.heightAnchor.constraint(equalToConstant: 30),
            
            middleBar.topAnchor.constraint(equalTo: userInfo.bottomAnchor, constant: 14),
            middleBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            middleBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            
            divider.widthAnchor.constraint(equalTo: self.widthAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2),
            
            gridButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            
            navGallery.topAnchor.constraint(equalTo: middleBar.bottomAnchor, constant: 14),
            navGallery.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navGallery.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navGallery.heightAnchor.constraint(equalToConstant: barHeight),
            
            collectionView.topAnchor.constraint(equalTo: navGallery.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            tabBar.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 2),
            tabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: barHeight),
            
            profileButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor)
        ])
    }
    
    // MARK: - Setup
    func setCollectionView() {
        collectionView.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.identifier)
    }
}
