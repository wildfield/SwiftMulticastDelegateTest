//
//  Model.swift
//  MulticastDelegateTest
//
//  Created by Dmitriy on 6/28/15.
//  Copyright (c) 2015 Dmitry K. All rights reserved.
//

import UIKit

@objc protocol ModelDelegate: class {
    func modelTextWasUpdated(text: String)
}

class Model {
    let delegates = MulticastDelegate<ModelDelegate>()
    var text: String = "Default" {
        didSet {
            self.delegates.call{ $0.modelTextWasUpdated(self.text) }
        }
    }
}
