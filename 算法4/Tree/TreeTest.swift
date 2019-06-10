//
//  TreeTest.swift
//  算法4
//
//  Created by liushan on 2019/5/28.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class TreeTest {
    static func main() {
        let bst = BST<String, String>()
        let keys = ["E","D","Q","A","J","T","M","S"]
        for key in keys {
            bst.put(key, forKey: key)
        }
        bst.printRoot()
    }
}
