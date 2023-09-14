//
//  ViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/13.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let stringUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"

    override func loadView() {
        let mainView = HomeView()
        self.view = mainView
        configureView(mainView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureView(_ view: HomeView) {
        view.delegate = self
        view.mainImageUrl = URL(string: stringUrl)
    }
}

extension HomeViewController: HomeViewDelegate {
    func showTodoListButtonTapped() {
        let moveVC = TodoListViewController()
        let naviVC = UINavigationController(rootViewController: moveVC)
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true)
    }
    
    func showCompletionTodoListButtonTapped() {
        
    }
    
    func showProfileButtonTapped() {
        
    }
}
