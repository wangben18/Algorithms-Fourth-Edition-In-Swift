//
//  DirectedCycle.swift
//  算法4
//
//  Created by liushan on 2019/6/3.
//  Copyright © 2019 liushan. All rights reserved.
//

import Foundation

class DirectedCycle {
    private(set) var marked: [Bool]
    private var edgeTo: [Int?]
    private(set) var cycle: [Int]? // Stack
    private var onStack: [Bool]
    
    init(_ G: Digraph) {
        marked = [Bool](repeating: false, count: G.V)
        edgeTo = [Int?](repeating: nil, count: G.V)
        onStack = [Bool](repeating: false, count: G.V)
        for v in 0..<G.V {
            if !marked[v] {
                dfs(G, v)
            }
        }
    }
    
    private func dfs(_ G: Digraph, _ v: Int) {
        onStack[v] = true
        marked[v] = true
        for w in G.adj(v) {
            if hasCycle() {
                return
            } else if !marked[w] {
                edgeTo[w] = v
                dfs(G, w)
            } else if onStack[w] {
                cycle = [Int]()
                var x: Int? = v
                while x != w {
                    cycle!.insert(x!, at: 0)
                    x = edgeTo[x!]
                }
                cycle!.insert(w, at: 0)
                cycle!.insert(v, at: 0)
            }
        }
        onStack[v] = false
    }
    
    func hasCycle() -> Bool {
        return cycle != nil
    }
}
