//
//  DirectedEdge.swift
//  算法4
//
//  Created by liushan on 2019/6/6.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DirectedEdge {
    let from: Int
    let to: Int
    let weight: Double
    
    init(from: Int, to: Int, _ weight: Double) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    func description() -> String {
        return "\(from)->\(to) \(weight)"
    }
}
