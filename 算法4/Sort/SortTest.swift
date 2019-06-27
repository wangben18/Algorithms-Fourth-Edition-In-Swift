//
//  SortTest.swift
//  算法4
//
//  Created by liushan on 2019/6/27.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class SortTest {
    static func main() {
        var a = ["a", "c", "b"]
        Insertion.sort(&a)
        print(a)
    }
}
