//
//  DetailProfileViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/22.
//

import UIKit

class DetailProfileViewController: UIViewController {
    
    private let mainView = DetailProfileView()
    
    var viewModel: DetailProfileViewModel!
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = DetailProfileViewModel()
        mainView.viewModel = viewModel
        viewModel.completionHandler = {
            self.mainView.setupData()
        }
        viewModel.user = User(name: "최홍식짱", age: 10)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
