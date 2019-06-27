//
//  Insertion.swift
//  算法4
//
//  Created by liushan on 2019/6/27.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class Insertion {
    static func sort<T: Comparable>(_ a: inout [T]) {
        let N = a.count
        for i in 1..<N {
            var j = i
            while j > 0 && a[j] < a[j-1] {
                (a[j], a[j-1]) = (a[j-1], a[j])
                j -= 1
            }
        }
    }
}
