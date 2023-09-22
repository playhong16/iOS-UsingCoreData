//
//  DetailProfileViewController.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/22.
//

import UIKit

class DetailProfileViewController: UIViewController {
    
    private let mainView = DetailProfileView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = mainView
        mainView.setupData(name: "최홍식", age: 8)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
