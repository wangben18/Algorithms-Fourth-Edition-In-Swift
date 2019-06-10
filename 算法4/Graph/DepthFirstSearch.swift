//
//  DepthFirstSearch.swift
//  算法4
//
//  Created by liushan on 2019/5/28.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DepthFirstSearch {
    private(set) var marked: [Bool]
    private(set) var count = 0
    
    init(_ G: Graph, _ s: Int) {
        marked = [Bool](repeating: false, count: G.V)
        dfs(G, s)
    }
    
    private func dfs(_ G: Graph, _ v: Int) {
        marked[v] = true
        count += 1
        for w in G.adj(v) {
            if !marked[w] {
                dfs(G, w)
            }
        }
    }
}
