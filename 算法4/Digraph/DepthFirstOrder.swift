//
//  DepthFirstOrder.swift
//  算法4
//
//  Created by liushan on 2019/6/3.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DepthFirstOrder {
    private var marked: [Bool]
    private(set) var pre = [Int]() // Queue
    private(set) var post = [Int]() // Queue
    
    init(_ G: Digraph) {
        marked = [Bool](repeating: false, count: G.V)
        for v in 0..<G.V {
            if !marked[v] {
                dfs(G, v)
            }
        }
    }
    
    private func dfs(_ G: Digraph, _ v: Int) {
        pre.append(v)
        marked[v] = true
        for w in G.adj(v) {
            if !marked[w] {
                dfs(G, w)
            }
        }
        post.append(v)
    }
    
    func reversePost() -> [Int] {
        return post.reversed()
    }
}
