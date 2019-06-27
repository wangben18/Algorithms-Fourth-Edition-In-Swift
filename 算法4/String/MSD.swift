//
//  MSD.swift
//  算法4
//
//  Created by liushan on 2019/6/27.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class MSD {
    private static let R = 256 // 基数
    private static let M = 15 // 小数组的切换阀值
    private static var aux = [[Character]]() // 数据分类的辅助数组
    private static func charAt(_ s: String, _ d: Int) -> Int {
        if d < s.count {
            return Int(Array(s)[d].asciiValue!)
        } else {
            return -1
        }
    }
    
    static func sort(_ a: inout [String]) {
        let N = a.count
        aux = [[Character]](repeating: [], count: N)
        sort(&a, 0, N-1, 0)
    }
    
    private static func sort(_ a: inout [String], _ lo: Int, _ hi: Int, _ d: Int) {
        guard hi > lo + M else {
            Insertion.sort(&a)
            return
        }
        var count = [Int](repeating: 0, count: R+2)
        for i in lo...hi {
            count[charAt(a[i], d) + 2] += 1
        }
        for r in 0..<R+1 {
            count[r+1] += count[r]
        }
        for i in lo...hi {
            aux[count[charAt(a[i], d) + 1]] = Array(a[i])
            count[charAt(a[i], d) + 1] += 1
        }
        for i in lo...hi {
            a[i] = String(aux[i - lo])
        }
        for r in 0..<R {
            sort(&a, lo + count[r], lo + count[r + 1] - 1, d+1)
        }
    }
}
