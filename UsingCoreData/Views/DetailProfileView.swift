//
//  DetailProfileView.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/22.
//

import UIKit

class DetailProfileView: UIView {
    var viewModel: DetailProfileViewModel!
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [nameLabel, ageLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(infoStackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            infoStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupData() {
        guard let age = viewModel.age else { return }
        nameLabel.text = viewModel.name
        ageLabel.text = String(age)
    }
}
