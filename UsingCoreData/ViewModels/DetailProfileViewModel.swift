//
//  DetailProfileViewModel.swift
//  UsingCoreData
//
//  Created by playhong on 2023/09/23.
//

import UIKit

class DetailProfileViewModel {
    var user: User? {
        didSet {
            completionHandler()
        }
    }
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var name: String? {
        user?.name
    }
    
    var age: Int? {
        user?.age
    }
    
    var completionHandler: () -> Void = {}
}
