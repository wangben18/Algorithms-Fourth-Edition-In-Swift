//
//  Quick3string.swift
//  算法4
//
//  Created by liushan on 2019/6/27.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class Quick3string {
    private static func charAt(_ s: String, _ d: Int) -> Int {
        if d < s.count {
            return Int(Array(s)[d].asciiValue!)
        } else {
            return -1
        }
    }
    
    static func sort(_ a: inout [String]) {
        sort(&a, 0, a.count-1, 0)
    }
    
    static func sort(_ a: inout [String], _ lo: Int, _ hi: Int, _ d: Int) {
        guard hi > lo else { return }
        var lt = lo, gt = hi
        let v = charAt(a[lo], d)
        var i = lo + 1
        while i <= gt {
            let t = charAt(a[i], d)
            if t < v {
                (a[lt], a[i]) = (a[i], a[lt])
                lt += 1; i += 1
            } else if t > v {
                (a[gt], a[i]) = (a[i], a[gt])
                gt -= 1
            } else {
                i += 1
            }
        }
        // a[lo...lt-1] < v = a[lt...gt] < a[gt+1...hi]
        sort(&a, lo, lt-1, d)
        if v >= 0 {
            sort(&a, lt, gt, d+1)
        }
        sort(&a, gt+1, hi, d)
    }
}
