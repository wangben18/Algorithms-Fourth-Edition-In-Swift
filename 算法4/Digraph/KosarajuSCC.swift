//
//  KosarajuSCC.swift
//  算法4
//
//  Created by liushan on 2019/6/4.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class KosarajuSCC {
    private var marked: [Bool]
    private(set) var id: [Int]
    private(set) var count = 0
    
    init(_ G: Digraph) {
        marked = [Bool](repeating: false, count: G.V)
        id = [Int](repeating: 0, count: G.V)
        let order = DepthFirstOrder(G.reverse())
        for s in order.reversePost() {
            if !marked[s] {
                dfs(G, s)
                count += 1
            }
        }
    }
    
    private func dfs(_ G: Digraph, _ v: Int) {
        marked[v] = true
        id[v] = count
        for w in G.adj(v) {
            if !marked[w] {
                dfs(G, w)
            }
        }
    }
    
    public func stronglyConnected(_ v: Int, _ w: Int) -> Bool {
        return id[v] == id[w]
    }
}
