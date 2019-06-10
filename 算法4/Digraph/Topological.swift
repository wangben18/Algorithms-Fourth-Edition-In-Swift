//
//  Topological.swift
//  算法4
//
//  Created by liushan on 2019/6/3.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class Topological {
    private(set) var order: [Int]?
    
    init(_ G: Digraph) {
        guard !DirectedCycle(G).hasCycle() else {
            return
        }
        order = DepthFirstOrder(G).reversePost()
    }
    
    func isDAG() -> Bool {
        return order != nil
    }
}
