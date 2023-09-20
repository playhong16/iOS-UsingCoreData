//
//  UILabel+Extension.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/20.
//

import UIKit

extension UILabel {
    func strikethrough(from text: String?, at range: Int?) {
        guard let text = text, let range = range else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue,
                                      range: NSMakeRange(0, range))
        self.attributedText = attributedString
    }
}
