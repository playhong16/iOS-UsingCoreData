//
//  ProfileViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/16.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let mainView = ProfileView()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.identifier, for: indexPath) as? PictureCell else { return UICollectionViewCell() }
        return cell
    }
}

extension ProfileViewController: ProfileViewDelegate {
    func cancelButtonTapped() {
        self.dismiss(animated: true)
    }
}
