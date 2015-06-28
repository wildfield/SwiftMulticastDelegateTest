//
//  MultiDelegate.swift
//  MulticastDelegateTest
//
//  Created by Dmitriy on 6/28/15.
//  Copyright (c) 2015 Dmitry K. All rights reserved.
//

import UIKit

class MulticastDelegate<T: AnyObject> {
    let delegates = NSHashTable(options: NSHashTableWeakMemory, capacity: 3)
    
    func add(object: T) {
        delegates.addObject(object)
    }
    
    func remove(object: T) {
        delegates.removeObject(object)
    }
    
    func removeAll() {
        delegates.removeAllObjects()
    }
    
    func call(block: (T) -> Void) {
        for object in delegates.objectEnumerator().allObjects {
            let delegate = object as! T
            block(delegate)
        }
    }
}
