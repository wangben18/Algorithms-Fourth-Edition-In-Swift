//
//  DirectedDFS.swift
//  算法4
//
//  Created by liushan on 2019/5/30.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DirectedDFS {
    private(set) var marked: [Bool]
    
    init(_ G: Digraph, _ s: Int) {
        marked = [Bool](repeating: false, count: G.V)
        dfs(G, s)
    }
    
    private func dfs(_ G: Digraph, _ v: Int) {
        marked[v] = true
        for w in G.adj(v) {
            if !marked[w] {
                dfs(G, w)
            }
        }
    }
}
