//
//  UIView+Extension.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/14.
//

import UIKit

extension UIView {
    func addSubViews(_ subViews: [UIView]) {
        subViews.forEach { subView in
            self.addSubview(subView)
        }
    }
}
