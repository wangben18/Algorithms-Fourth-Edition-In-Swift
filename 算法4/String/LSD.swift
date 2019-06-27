//
//  LSD.swift
//  算法4
//
//  Created by liushan on 2019/6/27.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class LSD {
    static func sort(_ a: inout [String], _ W: Int) {
        let N = a.count
        var achars = [[Character]]()
        for i in 0..<N {
            achars.append(Array(a[i]))
        }
        let R = 256 // 基数
        var aux = [[Character]](repeating: [Character](), count: N)
        for d in (0..<W).reversed() {
            var count = [Int](repeating: 0, count: R+1) // 计算出现频率
            for i in 0..<N {
                count[Int(achars[i][d].asciiValue!) + 1] += 1
            }
            for r in 0..<R { // 将频率转换为索引
                count[r+1] += count[r]
            }
            for i in 0..<N { // 将元素分类
                aux[count[Int(achars[i][d].asciiValue!)]] = achars[i]
                count[Int(achars[i][d].asciiValue!)] += 1
            }
            for i in 0..<N { // 回写
                a[i] = String(aux[i])
            }
        }
    }
}
