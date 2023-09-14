//
//  ViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/13.
//

import UIKit

class HomeViewController: UIViewController {
    
    let url = "https://spartacodingclub.kr/css/images/scc-og.jpg"

    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
    }
    
    func getImage() {
        guard let view = self.view as? HomeView else { return }
        guard let url = URL(string: self.url) else { return }
        view.mainImageView.loadImage(url: url)
        view.delegate = self
    }
}

extension HomeViewController: HomeViewDelegate {
    func showTodoListButtonTapped() {
        let moveVC = TodoListViewController()
        moveVC.modalPresentationStyle = .fullScreen
        present(moveVC, animated: true)
    }
}
