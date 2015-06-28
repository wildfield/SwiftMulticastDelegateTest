//
//  ReceiverView.swift
//  MulticastDelegateTest
//
//  Created by Dmitriy on 6/28/15.
//  Copyright (c) 2015 Dmitry K. All rights reserved.
//

import UIKit

class ReceiverView: UIView, ModelDelegate {
    let label = UILabel()
    
    override func didMoveToSuperview() {
        self.label.textAlignment = .Center
        self.addSubview(self.label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = self.bounds
    }
    
    func modelTextWasUpdated(text: String) {
        self.label.text = text
    }
}
