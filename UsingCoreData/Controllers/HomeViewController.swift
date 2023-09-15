//
//  ViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/13.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Properties
    private let stringUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"

    // MARK: - Life Cycle
    override func loadView() {
        let mainView = HomeView()
        self.view = mainView
        configureView(mainView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("HomeView Controller 사라집니다~~")
    }
    
    // MARK: - Configure
    private func configureView(_ view: HomeView) {
        view.delegate = self
        view.mainImageUrl = URL(string: stringUrl)
    }
}

// MARK: - HomeView Delegate
extension HomeViewController: HomeViewDelegate {
    func showTodoListButtonTapped() {
        let moveVC = TodoListViewController()
        let naviVC = UINavigationController(rootViewController: moveVC)
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true)
    }
    
    func showCompletionTodoListButtonTapped() {
        let moveVC = CompletionTodoListViewController()
        let naviVC = UINavigationController(rootViewController: moveVC)
        naviVC.modalPresentationStyle = .fullScreen
        present(naviVC, animated: true)
    }
    
    func showProfileButtonTapped() {
        
    }
}
